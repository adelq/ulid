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

suite "encode_time":
  test "should return expected encoded result":
    check("01ARYZ6S41" == encode_time(int(1469918176385), 10))

  test "should change length properly":
    check("0001AS99AA60" == encode_time(int(1470264322240), 12))

  test "should truncate time if not enough length":
    check("AS4Y1E11" == encode_time(int(1470118279201), 8))
