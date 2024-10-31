#!/bin/sh

8al test.l
8a asm.s
8l -o test -S test.8 asm.8
brandelf -t FreeBSD test
