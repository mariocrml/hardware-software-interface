// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	if(bits == 0) {
		return;
	}

	unsigned int valoare = *number;
	*number = (valoare << bits) | (valoare >> (32-bits));
}

void rotate_right(unsigned int *number, int bits)
{
	if(bits == 0) {
		return;
	}

	unsigned int valoare = *number;
	*number = (valoare >> bits) | (valoare << (32-bits));
}
