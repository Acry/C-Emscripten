CC       = gcc
JS_CC    = emcc
JSFLAGS   = -v
CFLAGS   = -Wall -Wextra -mtune=native -no-pie
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

.PHONY: clean
clean:
	@rm $(TARGETS) *.wasm *.log 2>/dev/null || true
