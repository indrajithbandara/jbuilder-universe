(** Writer monad *)

module Make (M : Monoid.S) : sig
  include Monad.S

  external run : 'a t -> M.t * 'a = "%identity"
  val writer : 'a -> M.t -> 'a t

  val tell : M.t -> unit t
  val listen : 'a t -> ('a * M.t) t
  val censor : (M.t -> M.t) -> 'a t -> 'a t
end
