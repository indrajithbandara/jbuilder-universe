## 113.43.00

- Dropped `Open_in_body` support from ppx\_let, since it was only ever used
  in confusing chains of `Let_syntax` modules that introduced other
  `Let_syntax` modules in the "body" (e.g. for defining Commands whose
  bodies use Async).  In this case it was decided that the better
  practice is to be explicit with `open ___.Let_syntax` at the different
  transition points, even though this is more verbose.
