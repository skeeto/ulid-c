# ULID Library (C99)

This is a library for generating and handling [Universally Unique
Lexicographically Sortable Identifiers][ulid] (ULIDs). On modern
hardware it can generate 30 million ULIDs per second. Supported
operating systems: POSIX and Win32.

This repository also includes a `ulidgen` command line utility for
generating, validating, and inspecting ULIDs.

## Documentation

The complete API documentation is found in `ulid.h`. Here's summary of
the available functions:

```c
void ulid_generator_init(struct ulid_generator *, int flags);
void ulid_generate(struct ulid_generator *, char [27]);
void ulid_encode(char [27], const unsigned char [16]);
int  ulid_decode(unsigned char[16], const char *);
```

Here are the command line switches for `ulidgen`:

```
usage: ulidgen -G [-r] [-n N]
       ulidgen -C <ULIDs...>
       ulidgen -T <ULIDs...>
       ulidgen -h
  -G      Generate ULIDs
  -C      Check/validate ULIDs
  -T      Print timestamp from ULIDs
  -h      Display this help message
  -i      (-C|-T) Read ULIDs on standard input
  -n N    (-G) Number of ULIDs to generate [1]
  -p      (-G) Only use 79 random bits to avoid overflow
  -q      (-C) Don't print invalid ULIDs
  -r      (-G) Unordered ULIDs within same timestamp
```

[ulid]: https://github.com/ulid/spec
