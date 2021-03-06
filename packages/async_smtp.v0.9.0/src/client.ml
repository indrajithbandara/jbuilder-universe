open Core
open Async
open Email_message.Std
open Types

module Config = Client_config

include Client_raw
module Log = Mail_log

let with_reset t ~log ~flows ~component ~f =
  let component = component @ ["reset"] in
  let reset t =
    send_receive t ~log ~flows ~component ~here:[%here] Command.Reset
    >>=? function
    | `Bsmtp -> return (Ok ())
    | `Received { Reply.code = `Ok_completed_250; _ } -> return (Ok ())
    | `Received reject ->
      return (Or_error.errorf !"Unexpected response to RESET: %{Reply}" reject)
  in
  Deferred.Or_error.try_with_join (fun () -> f t)
  >>= function
  | Error err ->
    reset t
    >>| fun (_ : unit Or_error.t) ->
    Error err
  | Ok ok -> Deferred.Or_error.return ok

module Envelope_status = struct
  type envelope_id = string [@@deriving sexp]
  type rejected_recipients = (Email_address.t * Reply.t) list [@@deriving sexp]
  type ok = envelope_id * rejected_recipients [@@deriving sexp]
  type err =
    [ `Rejected_sender of Reply.t
    | `No_recipients of rejected_recipients
    | `Rejected_sender_and_recipients of Reply.t * rejected_recipients
    | `Rejected_body of Reply.t * rejected_recipients
    ] [@@deriving sexp]
  type t = (ok, err) Result.t [@@deriving sexp]

  let rejected_recipients_to_string ~ok ~err rejected_recipients =
    if not (List.is_empty rejected_recipients) then
      rejected_recipients
      |> List.map ~f:(fun (email, reject) ->
        sprintf !"%{Email_address} (%{Reply})" email reject)
      |> String.concat ~sep:", "
      |> sprintf "%s %s" err
    else
      ok

  let to_string = function
    | Ok (envelope_id, rejected_recipients) ->
      sprintf "Envelope accepted (%s)%s"
        envelope_id
        (rejected_recipients_to_string
           ~ok:""
           ~err:" but rejected recipients: "
           rejected_recipients)
    | Error (`Rejected_sender reject) ->
      sprintf !"Rejected sender (%{Reply})" reject
    | Error (`No_recipients rejected_recipients) ->
      rejected_recipients_to_string
        ~ok:"No Recipients"
        ~err:"All recipients rejected: "
        rejected_recipients
    | Error (`Rejected_sender_and_recipients (reject,rejected_recipients)) ->
      sprintf !"Rejected combination of Sender and Recipients (%{Reply})%s"
        reject
        (rejected_recipients_to_string
           ~ok:""
           ~err:" and rejected recipients: "
           rejected_recipients)
    | Error (`Rejected_body (reject,rejected_recipients)) ->
      sprintf !"Rejected envelope (%{Reply})%s"
        reject
        (rejected_recipients_to_string
           ~ok:""
           ~err:" and rejected recipients: "
           rejected_recipients)

  let ok_or_error ~allow_rejected_recipients = function
    | Ok (envelope_id, rejected_recipients)
      when allow_rejected_recipients || List.is_empty rejected_recipients ->
      Ok envelope_id
    | error ->
      Error (Error.of_thunk (fun () -> to_string error))

  let ok_exn ~allow_rejected_recipients = function
    | Ok (envelope_id, rejected_recipients)
      when allow_rejected_recipients || List.is_empty rejected_recipients ->
      envelope_id
    | error ->
      failwith (to_string error)
end

(* Better names welcome. *)
module Smtp_monad = struct
  type 'a t = ('a, Envelope_status.err) Result.t Or_error.t Deferred.t

  let (>>=) (a : 'a t) f =
    a >>=? function
    | Error err -> Deferred.Or_error.return (Error err)
    | Ok a -> f a
end

let (>>=??) = Smtp_monad.(>>=)

let send_envelope t ~log ?flows ?(component=[]) envelope : Envelope_status.t Deferred.Or_error.t =
  let flows = match flows with
    | None -> Log.Flows.create `Outbound_envelope
    | Some flows -> flows
  in
  let component = component @ ["send-envelope"] in
  with_reset t ~log ~flows ~component ~f:(fun t ->
    Log.info log (lazy (Log.Message.create
                          ~here:[%here]
                          ~flows
                          ~component
                          ~email:(`Envelope envelope)
                          ?dest:(remote_address t)
                          ~session_marker:`Sending
                          "sending"));
    send_receive t ~log ~flows ~component:(component @ ["sender"]) ~here:[%here]
      (Command.Sender (Sender.to_string_with_arguments (Envelope.sender envelope, Envelope.sender_args envelope)))
    >>=? begin function
    | `Bsmtp -> return (Ok (Ok ()))
    | `Received { Reply.code = `Ok_completed_250; _ } -> return (Ok (Ok ()))
    | `Received reply ->
      Log.info log (lazy (Log.Message.create
                            ~here:[%here]
                            ~flows
                            ~component:(component @ ["sender"])
                            ~reply "send rejected"));
      return (Ok (Error (`Rejected_sender reply)))
    end
    >>=?? fun () ->
    begin
      Deferred.Or_error.List.map ~how:`Sequential
        (Envelope.recipients envelope)
        ~f:(fun recipient ->
          send_receive t ~log ~flows ~component:(component @ ["recipient"]) ~here:[%here]
            (Command.Recipient (recipient |> Email_address.to_string))
          >>|? function
          | `Bsmtp -> `Fst recipient
          | `Received { Reply.code = `Ok_completed_250; _ } -> `Fst recipient
          | `Received reply ->
            Log.info log (lazy (Log.Message.create
                                  ~here:[%here]
                                  ~flows
                                  ~component:(component @ ["recipient"])
                                  ~reply "send rejected"));
            `Snd (recipient, reply))
      >>|? List.partition_map ~f:ident
      >>|? function
      | ([], rejected_recipients) ->
        Error (`No_recipients rejected_recipients)
      | (accepted_recipients, rejected_recipients) ->
        Ok (accepted_recipients, rejected_recipients)
    end
    >>=?? fun (accepted_recipients,rejected_recipients) ->
    send_receive t ~log ~flows ~component:(component @ ["data"]) ~here:[%here] Command.Data
    >>=? begin function
    | `Bsmtp -> return (Ok (Ok ()))
    | `Received { Reply.code = `Start_mail_input_354; _ } -> return (Ok (Ok ()))
    | `Received reply ->
      Log.info log (lazy (Log.Message.create
                            ~here:[%here]
                            ~flows
                            ~component:(component @ ["data"])
                            ~reply "send rejected"));
      return (Ok (Error (`Rejected_sender_and_recipients (reply,
                                                          rejected_recipients))))
    end
    >>=?? fun () ->
    begin
      Deferred.Or_error.try_with_join (fun () ->
        Log.debug log (lazy (Log.Message.create
                               ~here:[%here]
                               ~flows
                               ~component:(component @ ["data"])
                               "starting transmitting body"));
        let writer = writer t in
        let block_length = ref 0 in
        (* We will send at most [max_block_length + <max line length> + 1]
           bytes per block. *)
        let max_block_length = 16 * 1024 in
        let timeout = Config.send_receive_timeout (config t) in
        let flush () =
          Clock.with_timeout timeout (Writer.flushed writer)
          >>| function
          | `Timeout ->
            Or_error.errorf !"Timeout %{Time.Span} waiting for data to flush" timeout
          | `Result () -> Ok ()
        in
        Envelope.email envelope
        |> Email.to_string
        |> String.split ~on:'\n'
        |> Deferred.Or_error.List.iter ~how:`Sequential ~f:(fun line ->
          begin
            if !block_length >= max_block_length
            then begin
              block_length := 0;
              flush ()
            end else Deferred.Or_error.ok_unit
          end
          >>|? fun () ->
          (* dot escaping... *)
          if String.is_prefix ~prefix:"." line then begin
            block_length := !block_length + 1;
            Writer.write writer "."
          end;
          block_length := !block_length + String.length line;
          Writer.write_line writer line
        )
        >>=? fun () ->
        Writer.write_line writer ".";
        flush ()
        >>=? fun () ->
        Log.debug log (lazy (Log.Message.create
                               ~here:[%here]
                               ~flows
                               ~component:(component @ ["data"])
                               "finishing transmitting body"));
        receive t ~timeout:(Config.final_ok_timeout (config t))
          ~log ~flows ~component ~here:[%here]
        >>|? function
        | `Bsmtp ->
          Log.info log (lazy (Log.Message.create
                                ~here:[%here]
                                ~flows
                                ~component
                                ~recipients:(List.map accepted_recipients ~f:(fun e -> `Email e))
                                "delivered"));
          Ok ("bsmtp", rejected_recipients)
        | `Received { Reply.code = `Ok_completed_250; raw_message } ->
          let remote_id = String.concat ~sep:"\n" raw_message in
          Log.info log (lazy (Log.Message.create
                                ~here:[%here]
                                ~flows
                                ~component
                                ~recipients:(List.map accepted_recipients ~f:(fun e -> `Email e))
                                ?dest:(remote_address t)
                                ~tags:[ "remote-id",remote_id ]
                                "sent"));
          Ok (remote_id, rejected_recipients)
        | `Received reply ->
          Log.info log (lazy (Log.Message.create
                                ~here:[%here]
                                ~flows
                                ~component
                                ~recipients:(List.map accepted_recipients ~f:(fun e -> `Email e))
                                ~reply
                                "send rejected"));
          Error (`Rejected_body (reply, rejected_recipients)))
    end)

module Tcp = struct
  let with_ ?buffer_age_limit ?interrupt ?reader_buffer_size ?timeout
        ?(config = Config.default)
        ?(credentials = None)
        ~log
        ?(flows=Log.Flows.none)
        ?(component=[])
        dest
        ~f =
    let flows = Log.Flows.extend flows `Client_session in
    let component = component @ ["smtp-client"] in
    let with_connection address f =
      Deferred.Or_error.try_with_join (fun () ->
        Tcp.with_connection
          ?buffer_age_limit
          ?interrupt
          ?reader_buffer_size
          ?timeout
          address
          f)
    in
    let f _socket reader writer =
      Log.debug log
        (lazy (Log.Message.create
                 ~here:[%here]
                 ~flows
                 ~component:(component @ ["tcp"])
                 ~remote_address:dest
                 "connection established"));
      create ~dest ~flows reader writer config
      (* Flow already attatched to the session *)
      |> with_session ~log ~component ~credentials ~f
    in
    match dest with
    | `Inet hp ->
      let address =
        Tcp.to_host_and_port
          (Host_and_port.host hp)
          (Host_and_port.port hp)
      in
      with_connection address f
    | `Unix file ->
      with_connection (Tcp.to_file file) f
end

(* BSMTP writing *)
module Bsmtp = struct
  let config =
    { Config.
      tls = []
    ; greeting = Some "bsmtp"
    ; send_receive_timeout = `This (Time.Span.of_sec 5.)
    ; final_ok_timeout = `This (Time.Span.of_sec 5.)
    }

  let bsmtp_log = Lazy.map Async.Log.Global.log ~f:(fun log ->
    Log.adjust_log_levels ~remap_info_to:`Debug log)


  let with_ ?(skip_prelude_and_prologue=false) writer ~log ~component ~f =
    create_bsmtp
      writer
      config
    |> fun t ->
    if skip_prelude_and_prologue then f t
    else do_helo t ~log ~component >>=? fun () -> f t

  let write ?skip_prelude_and_prologue ?(log=Lazy.force bsmtp_log) ?flows ?(component=["bsmtp";"writer"]) writer envelopes =
    with_ ?skip_prelude_and_prologue writer ~log ~component ~f:(fun client ->
      Deferred.Or_error.try_with (fun () ->
        Pipe.iter envelopes ~f:(fun envelope ->
          (* Flow already attatched to the session *)
          send_envelope client ~log ?flows ~component envelope
          >>| Or_error.ok_exn
          >>| Envelope_status.ok_exn ~allow_rejected_recipients:false
          >>| (ignore:string -> unit))))
end
