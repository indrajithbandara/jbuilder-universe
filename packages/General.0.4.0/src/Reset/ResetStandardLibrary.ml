RESET_MODULE(OCamlStandard)
  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/core.html *)
  ALIAS_MODULE(Pervasives)

  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/stdlib.html *)
  ALIAS_MODULE(Arg)
  ALIAS_MODULE(Array)
  ALIAS_MODULE(ArrayLabels)
  ALIAS_MODULE(Buffer)
  ALIAS_MODULE(Bytes)
  ALIAS_MODULE(BytesLabels)
  ALIAS_MODULE(Callback)
  ALIAS_MODULE(Char)
  ALIAS_MODULE(Complex)
  ALIAS_MODULE(Digest)
  #ifdef HAS_Ephemeron
  ALIAS_MODULE(Ephemeron)
  #endif
  ALIAS_MODULE(Filename)
  ALIAS_MODULE(Format)
  ALIAS_MODULE(Gc)
  ALIAS_MODULE(Genlex)
  ALIAS_MODULE(Hashtbl)
  ALIAS_MODULE(Int32)
  ALIAS_MODULE(Int64)
  ALIAS_MODULE(Lazy)
  ALIAS_MODULE(Lexing)
  ALIAS_MODULE(List)
  ALIAS_MODULE(ListLabels)
  ALIAS_MODULE(Map)
  ALIAS_MODULE(Marshal)
  ALIAS_MODULE(MoreLabels)
  ALIAS_MODULE(Nativeint)
  ALIAS_MODULE(Oo)
  ALIAS_MODULE(Parsing)
  ALIAS_MODULE(Printexc)
  ALIAS_MODULE(Printf)
  ALIAS_MODULE(Queue)
  ALIAS_MODULE(Random)
  ALIAS_MODULE(Scanf)
  ALIAS_MODULE(Set)
  ALIAS_MODULE(Sort)
  #ifdef HAS_Spacetime
  ALIAS_MODULE(Spacetime)
  #endif
  ALIAS_MODULE(Stack)
  ALIAS_MODULE(StdLabels)
  ALIAS_MODULE(Stream)
  ALIAS_MODULE(String)
  ALIAS_MODULE(StringLabels)
  ALIAS_MODULE(Sys)
  #ifdef HAS_Uchar
  ALIAS_MODULE(Uchar)
  #endif
  ALIAS_MODULE(Weak)

  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/parsing.html *)

  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libunix.html *)

  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libnum.html *)
  ALIAS_MODULE(Num)
  ALIAS_MODULE(Big_int)
  ALIAS_MODULE(Arith_status)

  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libstr.html *)
  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libthreads.html *)
  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libgraph.html *)
  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libdynlink.html *)
  (* https://caml.inria.fr/pub/docs/manual-ocaml-4.05/libbigarray.html *)
end

EMPTY_MODULE(Pervasives)

EMPTY_MODULE(Arg)
RESET_MODULE(Array)
  ALIAS_VALUE(get, 'a array -> int -> 'a, Array.get)
  ALIAS_VALUE(set, 'a array -> int -> 'a -> unit, Array.set)
end
EMPTY_MODULE(ArrayLabels)
EMPTY_MODULE(Buffer)
EMPTY_MODULE(Bytes)
EMPTY_MODULE(BytesLabels)
EMPTY_MODULE(Callback)
EMPTY_MODULE(Char)
EMPTY_MODULE(Complex)
EMPTY_MODULE(Digest)
#ifdef HAS_Ephemeron
EMPTY_MODULE(Ephemeron)
#endif
EMPTY_MODULE(Filename)
EMPTY_MODULE(Format)
EMPTY_MODULE(Gc)
EMPTY_MODULE(Genlex)
EMPTY_MODULE(Hashtbl)
EMPTY_MODULE(Int32)
EMPTY_MODULE(Int64)
EMPTY_MODULE(Lazy)
EMPTY_MODULE(Lexing)
EMPTY_MODULE(List)
EMPTY_MODULE(ListLabels)
EMPTY_MODULE(Map)
EMPTY_MODULE(Marshal)
EMPTY_MODULE(MoreLabels)
EMPTY_MODULE(Nativeint)
EMPTY_MODULE(Oo)
EMPTY_MODULE(Parsing)
EMPTY_MODULE(Printexc)
EMPTY_MODULE(Printf)
EMPTY_MODULE(Queue)
EMPTY_MODULE(Random)
EMPTY_MODULE(Scanf)
EMPTY_MODULE(Set)
EMPTY_MODULE(Sort)
#ifdef HAS_Spacetime
EMPTY_MODULE(Spacetime)
#endif
EMPTY_MODULE(Stack)
EMPTY_MODULE(StdLabels)
EMPTY_MODULE(Stream)
RESET_MODULE(String)
  ALIAS_VALUE(get, string -> int -> char, String.get)
  ALIAS_VALUE(set, bytes -> int -> char -> unit, OCamlStandard.Bytes.set)
end
EMPTY_MODULE(StringLabels)
EMPTY_MODULE(Sys)
#ifdef HAS_Uchar
EMPTY_MODULE(Uchar)
#endif
EMPTY_MODULE(Weak)

EMPTY_MODULE(Num)
EMPTY_MODULE(Big_int)
EMPTY_MODULE(Arith_status)
