import times
import "random-0.5.3/random"

const
  alphabet = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  alphabet_size = len(alphabet)

proc randFloat(): float =
  var buf = random.urandom(2)
  let offset = 0
  let rand = (cast[uint16](buf[offset]) shl 0) or
             (cast[uint16](buf[offset+1]) shl 8)
  return float(rand) / 0xFFFF

proc encode_time(now: int): string =
  result = ""
  var now = now
  var mo: int
  for x in 1..10:
    mo = now mod alphabet_size
    result = alphabet[mo] & result
    now = (now - mo) div alphabet_size

proc encode_random(): string =
  result = ""
  var rand: int
  for x in 1..16:
    rand = int(randFloat() * alphabet_size)
    result = alphabet[rand] & result

proc ulid*(): string =
  return encode_time(int(times.epochTime() * 1000)) & encode_random()
