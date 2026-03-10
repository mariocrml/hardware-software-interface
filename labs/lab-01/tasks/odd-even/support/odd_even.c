// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

void print_binary(int number, int nr_bits)
{
	printf("0b");
	for (int i = nr_bits - 1; i >= 0; i--) {
		int bit = (number >> i) & 1;
		printf("%d", bit);
	}
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	int x;
	for (int i = 0; i < n; i++) {
		x = *(numbers + i);
		if(x & 1) {
			printf("0x%08X\n", x);
		} else {
			print_binary(x, 8);
		}
	}
}
