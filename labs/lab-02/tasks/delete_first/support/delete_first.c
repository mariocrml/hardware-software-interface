// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
    char *p = strstr(s, pattern);
	
    if (p == NULL) {
        return s;
    }

    size_t pattern_len = strlen(pattern);
    strcpy(p, p + pattern_len);

    return s;
}
