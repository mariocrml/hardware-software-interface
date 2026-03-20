// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "find_max.h"

void *find_max(void *arr, int n, size_t element_size,
				int (*compare)(const void *, const void *))
{
	void *max_elem = arr;

	(void) n;
	(void) element_size;
	(void) compare;

	for (int i = 1; i < n; i++) {
		void *curent = (char *)arr + i * element_size;
		if (compare(curent, max_elem)) {
			max_elem = curent;
		}
	}
	return max_elem;

}

int compare(const void *a, const void *b)
{
	int val_a = *(int*)(a);
	int val_b = *(int*)(b);

	if(val_a > val_b) {
		return 1;
	} else {
		return 0;
	}
}
