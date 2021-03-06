## ![Alcotest logo](https://raw.githubusercontent.com/mirage/alcotest/master/alcotest-logo.png)

Alcotest is a lightweight and colourful test framework.

Alcotest exposes simple interface to perform unit tests. It exposes
a simple `TESTABLE` module type, a `check` function to assert test
predicates and a `run` function to perform a list of `unit -> unit`
test callbacks.

Alcotest provides a quiet and colorful output where only faulty runs
are fully displayed at the end of the run (with the full logs ready to
inspect), with a simple (yet expressive) query language to select the
tests to run.

[![Build Status](https://travis-ci.org/mirage/alcotest.svg)](https://travis-ci.org/mirage/alcotest)
[![docs](https://img.shields.io/badge/doc-online-blue.svg)](https://mirage.github.io/alcotest/alcotest/index.html)

### Examples

A simple example:

```ocaml
(* Build with `ocamlbuild -pkg alcotest simple.byte` *)

(* A module with functions to test *)
module To_test = struct
  let capit letter = Char.uppercase letter
  let plus int_list = List.fold_left (fun a b -> a + b) 0 int_list
end

(* The tests *)
let capit () =
  Alcotest.(check char) "same chars"  'A' (To_test.capit 'a')

let plus () =
  Alcotest.(check int) "same ints" 7 (To_test.plus [1;1;2;3])

let test_set = [
  "Capitalize" , `Quick, capit;
  "Add entries", `Slow , plus ;
]

(* Run it *)
let () =
  Alcotest.run "My first test" [
    "test_set", test_set;
  ]
```

The result is a self-contained binary which displays the test results. Use
`./simple.byte --help` to see the runtime options.

```shell
$ ./simple.native
[OK]        test_set  0   Capitalize.
[OK]        test_set  1   Add entries.
Test Successful in 0.001s. 2 tests run.
```

See the [examples](https://github.com/mirage/alcotest/tree/master/examples)
folder for more examples.
