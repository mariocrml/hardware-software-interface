// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	int i = 0;
	int len = 0;
	while (*(s + i) != '\0') {
		len++;
		i++;
	}
	for (int i = 0; i < len / 2; i++) {
		char c = *(s + i);
		*(s + i) = *(s + len - i - 1);
		*(s + len - i - 1) = c;
	}
	printf ("%s\n", s);
}
