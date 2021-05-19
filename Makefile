# This Makefile can be used with GNU Make or BSD Make

LIB=libfalcon-512_clean.a

SOURCES = codec.c common.c fft.c fpr.c keygen.c pqclean.c rng.c sign.c vrfy.c fips202.c randombytes.c
OBJECTS = codec.o common.o fft.o fpr.o keygen.o pqclean.o rng.o sign.o vrfy.o fips202.o randombytes.o
HEADERS = api.h fpr.h inner.h 

CFLAGS=-O3 -Wall -Wconversion -Wextra -Wpedantic -Wvla -Werror -Wmissing-prototypes -Wredundant-decls -std=c99

all: $(LIB)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

$(LIB): $(OBJECTS)
	$(AR) -r $@ $(OBJECTS)

clean:
	$(RM) $(OBJECTS)
	$(RM) $(LIB)
