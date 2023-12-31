#!/bin/sh

PROJECT=libbio

VERBOSITY=0
VERBOSITYFLAGS=""
while test "$1" = "-v"; do
	VERBOSITY=$((VERBOSITY+1))
	VERBOSITYFLAGS="$VERBOSITYFLAGS -v"
	shift
done

run()
{
	if test $VERBOSITY -gt 1; then echo "$@"; fi
	"$@" || exit 1
}

CFLAGS="-I../../../386/include -I../../include -ggdb -O0 -fno-inline"

STARTTIME=`date +%s`

case $1 in
	'')
		for file in `echo bbuffered.c bfildes.c bflush.c bgetc.c bgetrune.c bgetd.c binit.c boffset.c bprint.c bputc.c bputrune.c brdline.c brdstr.c bread.c bseek.c bwrite.c`; do
			run cc -c $CFLAGS $file
		done

		run ar rsc $PROJECT.a *.o
		run mkdir -p ../../lib
		run cp $PROJECT.a ../../lib
		;;
	clean)
		run rm -f *.o $PROJECT.a
		;;
	*)
		echo "Target is not supported!"
		;;
esac

ENDTIME=`date +%s`

echo Done $1 in $((ENDTIME-STARTTIME))s
