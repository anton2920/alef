#!/bin/sh

set -e

PROJECT=main

PATH=$HOME/Projects/alef-plan9port/bin:$PATH; export PATH

8al -w -I$HOME/Projects/alef-plan9port/include/alef $PROJECT.l
8l -o $PROJECT -S $PROJECT.8 $HOME/Projects/alef-plan9port/lib/alef/libA.a
brandelf -t FreeBSD $PROJECT
