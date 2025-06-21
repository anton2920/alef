#include <alef.h>

int
EchoServer(void)
{
	int	afd, dfd, lcfd;
	byte	adir[40], ldir[40];
	int	n;
	byte	buf[256];

	afd = announce("tcp!*!1234", adir);
	if (afd < 0)
		return - 1;

	for (; ; ) {
		/* listen for a call */
		lcfd = listen(adir, ldir);
		if (lcfd < 0)
			return - 1;

		/* fork a process to echo */
		switch (fork()) {
		case 0:
			/* accept the call and open the data file */
			dfd = accept(lcfd, ldir);
			if (dfd < 0)
				return - 1;
			/* echo until EOF */
			while ((n = read(dfd, buf, sizeof(buf))) > 0)
				write(dfd, buf, n);
			exits(nil);
		case -1:
			print("forking: %r");
		default:
			close(lcfd);
			break;
		}
	}

	return 0;
}


void
main()
{
	if (EchoServer() < 0) {
		print("echo: %r");
	}
}


