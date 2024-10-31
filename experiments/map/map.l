#include <alef.h>

adt Map[K, V]
{
	(K, V)	data[100];
	int		tos;

	void		Insert(*Map, K, V);
	(V, int)	Find(*Map, K);
};

void
Map.Insert(Map *m, K key, V value)
{
	m->data[m->tos++] = (key, value);
}

(V, int)
Map.Find(Map *m, K search)
{
	int found, i;
	V value;
	K key;

	found = 0;

	value = nil;
	for (i = 0; i < m->tos; ++i) {
		(key, value) = m->data[i];
		typeof search {
		case int:
			typeof key {
			case int:
				if (search == key) {
					found = 1;
				}
				break;
			}
			break;
		default:
			check 0, "Map only works with integer keys";
		}

		if (found) {
			unalloc key;
			return (value, 1);
		}
	}

	unalloc search;
	return (value, 0);
}

void
main(void)
{
	Map[int, int] m;
	int k, v, ok;

	m.Insert(1, 2);

	k = 1;
	(v, ok) = m.Find(k);
	if (!ok) {
		print("For key %d found nothing\n", k);
		return;
	}

	print("For key %d found value %d\n", k, v);

	(v, ok) = m.Find(k);
}


