import unittest
include ulid

suite "ulid":
  test "should return correct length":
    check(ulid().len == 26)
