# Package

version       = "0.2.0"
author        = "Adel Qalieh"
description   = "Universally Unique Lexicographically Sortable Identifier"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 0.16.0", "random 0.5.3"

# Tasks

task test, "Runs the test suite":
  exec "nim c -r tests/test.nim"

task perf, "Runs the benchmark":
  exec "nim c -r -d:release tests/bench.nim"
