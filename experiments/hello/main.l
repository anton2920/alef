#include <alef.h>
#include <fcall.h>

void
main(void)
{
	byte buffer[64];

	print("Current working dir: %s\n", getwd(buffer, sizeof(buffer)));
}


