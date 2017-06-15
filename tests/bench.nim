import nimbench
include ulid

bench(encode_time, m):
  for i in 1..m:
    discard encode_time(int(times.epochTime() * 1000))

bench(encode_random, m):
  for i in 1..m:
    discard encode_random()

bench(ulid, m):
  for i in 1..m:
    discard ulid()

runBenchmarks()
