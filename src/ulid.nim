import times
import pkg/random

const
  alphabet = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  alphabet_size = len(alphabet)

var rng = initSystemRandom()

proc encode_time(now: int, length = 10): string =
  result = ""
  var now = now
  var mo: int
  for x in 1..length:
    mo = now mod alphabet_size
    result = alphabet[mo] & result
    now = (now - mo) div alphabet_size

proc encode_random(length = 16): string =
  result = ""
  var rand: int
  for x in 1..length:
    rand = rng.randomInt(0, alphabet_size)
    result = alphabet[rand] & result

proc ulid*(now = 0): string =
  var now = now
  if now == 0:
    now = int(times.epochTime() * 1000)
  return encode_time(now) & encode_random()
