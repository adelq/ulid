import times, random
import "random-0.5.6/random" as randomPkg

const
  alphabet = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  alphabet_size = len(alphabet)

proc randFloat(): float =
  try:
    var buf = randomPkg.urandom(2)
    let offset = 0
    let rand = (cast[uint16](buf[offset]) shl 0) or
               (cast[uint16](buf[offset+1]) shl 8)
    return float(rand) / 0xFFFF
  except OSError:
    randomize()
    var buf = newSeq[uint8]()
    buf.add(rand(uint8))
    buf.add(rand(uint8))
    let offset = 0
    let rand = (cast[uint16](buf[offset]) shl 0) or
               (cast[uint16](buf[offset+1]) shl 8)
    return float(rand) / 0xFFFF

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
    rand = int(randFloat() * alphabet_size)
    result = alphabet[rand] & result

proc ulid*(now = 0): string =
  var now = now
  if now == 0:
    now = int(times.epochTime() * 1000)
  return encode_time(now) & encode_random()
