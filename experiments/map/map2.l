#include <alef.h>

adt Map[K, V]
{
	(K, V)	data[100];
	int	tos;

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
	int	i, found;
	V value;
	K key;

	value = nil;
	found = 0;

	typeof search {
	case int:
		for (i = 0; i < m->tos; ++i) {
			(key, value) = m->data[i];
			typeof key {
			case int:
				if (search == key) {
					found = 1;
					break;
				}
				break;
			}

			if (found) {
				break;
			}
		}
		break;
	}

	unalloc search;
	return (value, found);
}


void
main(void)
{
	Map m;
	int	k, ok;
	V v;

	//m.Insert((alloc K)1, (alloc V)2);
	//m.Insert((alloc K)2, (alloc V)4);

	k = 2;
	(v, ok) = m.Find((alloc K)k);
	if (!ok) {
		print("For key %d found nothing\n", k);
		return;
	}

	typeof v {
	case int:
		print("For key %d found %d\n", k, v);
		break;
	}
}


