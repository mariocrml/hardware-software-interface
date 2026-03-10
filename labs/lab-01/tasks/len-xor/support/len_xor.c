// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "len_xor.h"

int my_strlen(const char *str)
{
	int i = 0;
	int contor = 0;
	while(*(str + i) != '\0') {
		contor++;
		i++;
	}
	return contor;
}

void equality_check(const char *str)
{
	int len = my_strlen(str);
	for(int i = 0; i < len; i++) {
		int j = (1 << i);
		int k = (i + j) % len;
		char c_i = *(str + i);
		char c_k = *(str + k);
		if(!(c_i ^ c_k)) {
			printf ("Address of %c: %p\n",c_i, (void*)(str + i));
		}
	}
}
