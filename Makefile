.POSIX:
CC      = cc
CFLAGS  = -std=c99 -Wall -Wextra -ggdb3 -O3 -march=native
LDFLAGS =
LDLIBS  =

all: ulidgen tests/tests tests/benchmark

ulidgen: tests/ulidgen.c ulid.c ulid.h
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ tests/ulidgen.c ulid.c $(LDLIBS)

tests/tests: tests/tests.c ulid.c ulid.h
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ tests/tests.c ulid.c $(LDLIBS)

tests/benchmark: tests/benchmark.c ulid.c ulid.h
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ tests/benchmark.c $(LDLIBS)

check: tests/tests
	tests/tests

bench: tests/benchmark
	tests/benchmark

clean:
	rm -f ulidgen tests/tests tests/benchmark
