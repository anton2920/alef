#!/bin/sh

set -e

PATH=$HOME/Projects/alef-plan9port/bin:$PATH; export PATH

8al -w test.l
8a asm.s
8l -o test -S test.8 asm.8
brandelf -t FreeBSD test
