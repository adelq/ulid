import unittest
include ulid

suite "ulid":
  test "should return correct length":
    check(ulid().len == 26)

  test "should return expected encoded time component result":
    check("01ARYZ6S41" == ulid(int(1469918176385))[0..<10])
