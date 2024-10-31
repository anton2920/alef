void Exit(int);
int Write(int, void *, int);

int
Sum(int x, int y)
{
	return x + y;
}

int
PutInt(byte *buf, int x)
{
	int	ndigits, rx, i;
	int	sign;

	ndigits = 0;
	rx = 0;
	i = 0;
	sign = (x < 0);

	if (x == 0) {
		buf[0] = '0';
		return 1;
	}

	if (sign) {
		x = -x;
		buf[i++] = '-';
	}

	while (x > 0) {
		rx = (10 * rx) + (x % 10);
		x /= 10;
		++ndigits;
	}

	while (ndigits > 0) {
		buf[i++] = (rx % 10) + '0';
		rx /= 10;
		--ndigits;
	}

	return i;
}

void
_main()
{
	byte buffer[20];
	int x, y, z;
	int ndigits;

	x = 10;
	y = 20;
	z = Sum(x, y);

	ndigits = PutInt(buffer, z);
	buffer[ndigits] = '\n';

	Write(1, buffer, ndigits+1);
	Exit(0);
}
