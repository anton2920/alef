#!/bin/sh

set -e

PROJECT=map

PATH=$HOME/Projects/alef-plan9port/bin:$PATH; export PATH

8al -I$HOME/Projects/alef-plan9port/include/alef $PROJECT.l
8al -S -I$HOME/Projects/alef-plan9port/include/alef $PROJECT.l
8l -o $PROJECT -L$HOME/Projects/alef-plan9port/lib/alef $PROJECT.8 -lA
brandelf -t FreeBSD $PROJECT
