// SPDX-License-Identifier: BSD-3-Clause

#include <stddef.h>

#include "pointers.h"

int my_strcmp(const char *s1, const char *s2)
{
	while(*s1 != '\0' && *s1 == *s2) {
		s1++;
		s2++;
	}
	return *(unsigned char*)s1 - *(unsigned char*)s2;
}

void *my_memcpy(void *dest, const void *src, size_t n)
{
	unsigned char *d = (unsigned char *)dest;
    const unsigned char *s = (const unsigned char *)src;

    for (size_t i = 0; i < n; i++) {
		*(d + i) = *(s + i);
    }

    return dest;
}

char *my_strcpy(char *dest, const char *src)
{
	int i = 0;
	while(*(src + i) != NULL) {
		*(dest + i) = *(src + i);
		i++;
	}
	*(dest + i) = '\0';

	return dest;
}
