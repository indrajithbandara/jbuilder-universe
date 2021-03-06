# Stable Interface (v1.0)

  - [ ] Make the entire library `-safe-string` compliant. This will involve
    introducing a `Bytes` module, removing all direct mutation on strings from
    the `String` module, and "re-typing" string values that require mutation to
    `bytes`.

  - [ ] Do not export the `\*\_intf` modules from Base. Instead, any signatures
    sould be exported by the `.ml` and `.mli`s.

  - [ ] Modify the argument order of `fold_right` in the `List`, `Array`, and `Set`
    modules in the following way.

    ```ocaml
    val fold_right : 'a t -> init:'b -> f:('b -> 'a -> 'b) -> 'b
    ```

  - [ ] Only expose the first-class module interface of `Hashtbl`. Accompanying
    this should ba cleanup of `Hastbl_intf`, moving anything that's still
    required in core_kernel to the appropriate files in that project.

  - [ ] Replace `Hashtbl.create (module String) ()` by just
    `Hashtbl.create (module String)`

  - [ ] Remove `replace` from `Hashtbl_intf.Accessors`.

  - [ ] Label one of the arguments of `Hashtbl_intf.merge_into` to indicate the
    flow of data.

  - [ ] Merge `Hashtbl_intf.Key_common` and `Hashtbl_intf.Key_plain`.

  - [ ] Eliminate the `bit_*` functions from the `Int_intf` module. They are
    redundant with the infix bit twiddling operators.

  - [ ] Do not expose the type equality `Int63_emul.W.t = int64`.

  - [ ] Use `Either.t` as the return value for `Map.partition`.

  - [ ] Add `key` and `data` labels to `Map.singleton` arguments.

  - [ ] Rename `Monad_intf.all_ignore` to `Monad_intf.all_unit`.

  - [ ] Elminate all uses of `Not_found`, replacing them with descriptive error messages.

  - [ ] Remove `ignore` and `(=)` from `Sexp_conv`'s public interface.

  - [ ] Replace the exception thrown by `Float.of_string` with a named
    exception that's more descriptive.

  - [ ] Make the various comparision functions return an `Ordering.t`
    instead of an `int`

  - [ ] Move the various private modules to `Base.Base_private`
    instead of `Base.Exported_for_specific_uses` and `Base.Not_exposed_properly`

# Implementation Cleanup

  - [X] Delete the `Hashable` toplevel module. This is a vestige of the previous
    `Map` and `Set` implementations and is no longer needed.

  - [ ] Ensure that `Map` operations that are effective NO-OPs return the same
    `Map.t` they were provided. Candidate operations include e.g `add`, `remove`,
    `filter`.

  - [ ] Simplify the implementation of `Option.value_exn`, if possible.

  - [ ] Eliminate all instances of `open! Polymorphic_compare`

  - [ ] Refactor common blit code in `String.replace_all` and `String.replace_first`.

  - [ ] Delete unused function aliases in `Import0`

# Performance Improvements

  - [ ] In `Hash_set.diff`, use the size of each set to determine which to iterate
    over.

  - [ ] Ensure that the correct `compare` function and other related functions are
    exported by all modules. These functios should not be derived from
    a functor application, in order to ensure proper inlining. Implementing
    this change should also include benchmarks to verify the initial result,
    and to maintain it on an ongoing basis. See `bench/bench_int.ml` for
    examples.

  - [ ] Optimize `Lazy.compare` by performing a `phys_equal` check before
    forcing the lazy value. Note that this will also change the semantics of
    `compare` and should be documented and rolled out with care.

  - [ ] Conduct a thorough performance review of the `Sequence` module.

# Documentation

  - [ ] Consolidate documentation the interface and implementation files
    related to the `Hash` module.

  - [ ] Add documentation to the `Ref` toplevel module.
