// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max = *v;
	int i = 0;
	Max:
	if (*(v+i) < max) {
		goto Increment;
	}
	max = *(v+i);
	Increment:
	i++;
	if(i < len) {
		goto Max;
	}
	
	return max;
}
