import unittest
include ulid

suite "ulid":
  test "should return correct length":
    check(ulid().len == 26)

  test "should return expected encoded time component result":
    check("01ARYZ6S41" == ulid(int(1469918176385))[0..<10])

suite "encode_random":
  test "should return correct length":
    check(encode_random().len == 16)

  test "should return correct length when changed":
    check(encode_random(12).len == 12)
