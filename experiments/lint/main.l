#include <alef.h>

aggr Foo
{
	lint a;
	lint b;
};

void
main(void)
{
#if 1
	lint a, b;

	a = 5;
	b = 5;
	print("%d + %d = %d\n", a, b, a + b);
#else
	Timespec a, b;

	a = b;
	print("%d + %d = %d\n", a, b);
#endif
}
