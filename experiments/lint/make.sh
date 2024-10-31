#!/bin/sh

set -e

ALEF=$HOME/Projects/alef-plan9port
PATH=$ALEF/bin:$PATH

8al -I$ALEF/include/alef main.l
8l -o main -L$ALEF/lib/alef main.8 -lA
brandelf -t FreeBSD main
