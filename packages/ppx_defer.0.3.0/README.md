# ppx_defer - Go-like `[%defer later]; now` syntax.

This is an OCaml language extension implementing a somewhat Go-ish
`[%defer expr1]; expr2` which will defer the evaluation of `expr1` until after
`expr2`.  `expr1` will still be evaluated if `expr2` raises an exception.

If you are using Lwt you can use `[%defer.lwt expr1]; expr2`.

Thanks to Drup for guidance in figuring out ppx details!

## Using ppx_defer

```ocaml
let () =
  let ic = open_in_bin "some_file" in
  [%defer close_in ic];
  let length = in_channel_length ic in
  let bytes = really_input_string ic length in
  print_endline bytes
```

See the `examples/` directory for more examples.
