.POSIX:
CC      = cc
CFLAGS  = -std=c99 -Wall -Wextra -O3 -ggdb3
LDFLAGS =
LDLIBS  =

all: ulidgen tests/tests

ulidgen: tests/ulidgen.c ulid.c ulid.h
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ tests/ulidgen.c ulid.c $(LDLIBS)

tests/tests: tests/tests.c ulid.c ulid.h
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ tests/tests.c ulid.c $(LDLIBS)

check: tests/tests
	tests/tests

clean:
	rm -f ulidgen tests/tests
