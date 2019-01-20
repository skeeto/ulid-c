/* ULID generation and parsing library (API)
 *
 * This is free and unencumbered software released into the public domain.
 */
#ifndef ULID_H
#define ULID_H

#define ULID_RELAX     (1 << 0)
#define ULID_PARANOID  (1 << 1)

struct ulid_generator {
    unsigned char last[16];
    unsigned long long last_ts;
    int flags;
    unsigned char i, j;
    unsigned char s[256];
};

/* Initialize a new ULID generator instance.
 *
 * The ULID_RELAX flag allows ULIDs generated within the same
 * millisecond to be non-deterministically ordered, e.g. the random
 * section is generate fresh each time.
 *
 * The ULID_PARANOID flag causes the generator to clear the highest bit
 * of the random field, which guarantees that overflow cannot occur.
 * Normally the chance of overflow is non-zero, but negligible. This
 * makes it zero. It doesn't make sense to use this flag in conjunction
 * with ULID_RELAX.
 */
void ulid_generator_init(struct ulid_generator *, int flags);

/* Generate a new ULID.
 * A zero terminating byte is written to the output buffer.
 */
void ulid_generate(struct ulid_generator *, char [27]);

/* Encode a 128-bit binary ULID to its text format.
 * A zero terminating byte is written to the output buffer.
 */
void ulid_encode(char [27], const unsigned char [16]);

/* Decode a text ULID to a 128-bit binary ULID.
 * Returns non-zero if input was invalid.
 */
int  ulid_decode(unsigned char [16], const char *);

#endif
