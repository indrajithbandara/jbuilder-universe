open Core

(** Look for a newline in a given substring and returns its
    absolute position.
    Returns None if no newlines are found.
*)
let rec nl_between (s:string) ~(eol:char) ~(pos:int) ~(len:int) : int option =
  if len = 0 then None
  else if s.[pos] = eol then Some pos
  else nl_between s ~eol ~pos:(pos + 1) ~len:(len - 1)


let%test _ = nl_between "abcd" ~eol:'\n' ~pos:0 ~len:4 = None
let%test _ = nl_between "a\nb\ncd" ~eol:'\n' ~pos:0 ~len:6 = Some 1
let%test _ = nl_between "a\nb\ncd" ~eol:'\n' ~pos:3 ~len:3 = Some 3
let%test _ = nl_between "a\nb\ncd" ~eol:'\n' ~pos:4 ~len:2 = None

(**
   Type for line buffers.
   [flush] will be called back on every fully read newline or when the buffer
   itself is flushed by the user.
*)
type t = {
  buffer : Buffer.t;
  eol : char;
  flush : string -> unit
}

(*  *)
let create ?(eol='\n') flush = {
  buffer = Buffer.create 0;
  eol;
  flush;
}

let flush b =
  if Buffer.length b.buffer > 0 then begin
    b.flush (Buffer.contents b.buffer);
    Buffer.reset b.buffer
  end

let add_char b c =
  if c = b.eol then begin
    b.flush (Buffer.contents b.buffer);
    Buffer.reset b.buffer
  end else
    Buffer.add_char b.buffer c

let rec add_substring b s ~pos ~len =
  match nl_between s ~eol:b.eol ~pos ~len with
  | None -> Buffer.add_substring b.buffer s pos len
  | Some suffix_end_pos ->
    (* whatever is in the buffer + this suffix is our newline*)
    let suffix_len = suffix_end_pos - pos
    and prefix_len = Buffer.length b.buffer in
    let line = String.create (prefix_len + suffix_len) in
    Buffer.blit b.buffer 0 line 0 prefix_len;
    String.blit
      ~src:s
      ~dst:line
      ~src_pos:pos
      ~dst_pos:prefix_len
      ~len:suffix_len;
    Buffer.reset b.buffer;
    b.flush line;
    add_substring b s ~pos:(suffix_end_pos + 1) ~len:(len - suffix_len - 1)


let add_string b s =
  add_substring b s ~pos:0 ~len:(String.length s)

(** [test_list l]: adds all the strings in [l] to a new blank buffer and
    returns all the lines that the callback function was called on.*)
let test_list l =
  let lines = ref [] in
  let b = create (fun s -> lines := s :: !lines) in
  List.iter ~f:(fun s -> add_string b s) l;
  flush b;
  List.rev !lines

let%test _ = test_list ["abcd\nas\nere\n"] = ["abcd";"as";"ere"]
let%test _ = test_list ["ab";"cd";"\nas\n";"ere\n"] = ["abcd";"as";"ere"]
let%test _ = test_list ["no new\nline";" at the end"] = ["no new";"line at the end"]
let%test _ = test_list ["a new line";" at the end\n"] = ["a new line at the end"]
