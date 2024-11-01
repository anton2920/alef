#!/bin/sh

set -e

PROJECT=test18

8al -I$HOME/Projects/alef-plan9port/include/alef stack.l
8al -I$HOME/Projects/alef-plan9port/include/alef $PROJECT.l
8l -o $PROJECT *.8 $HOME/Projects/alef-plan9port/lib/alef/libA.a
brandelf -t FreeBSD $PROJECT
