CC       = gcc
JS_CC    = emcc
JFLAGS   = -v
CFLAGS   = -Wall -Wextra -mtune=native
LDFLAGS  = 

.SUFFIXES:
.SUFFIXES: .c .o

srcdir	 =src/
BinDir	 =./
TARGETS	 = main main.js main.html nweb

.PHONY: all
all: $(TARGETS)

main: main.c
	$(CC) $(CFLAGS) -o $@ $+ $(LDFLAGS)
# ./main

main.js: main.c
	$(JS_CC) $< -o $@
# node main.js

main.html: main.c
	$(JS_CC) $< -o $@
# use firefox main.html

# nweb is a small and very safe mini web server
# Nigel Griffiths
nweb: nweb23.c
	$(CC) $(CFLAGS) -o $@ $+ $(LDFLAGS)
# gcc -O -DLINUX nweb.c -o nweb
# ./nweb 8080 ./

.PHONY: clean
clean:
	@rm $(TARGETS) *.wasm *.log 2>/dev/null || true
