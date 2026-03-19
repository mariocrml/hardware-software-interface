// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
	int middle;
	int rezultat = -1;

	Main:
    if (start > end) {
        goto Return;
    }

    middle = (start + end) / 2;

    if (*(v + middle) == dest) {
        goto Gasit;
    }
    if (*(v + middle) > dest) {
        goto Little;
    }
    if (*(v + middle) < dest) {
        goto Big;
    }

    Little:
    end = middle - 1;
    goto Main;

    Big:
    start = middle + 1;
    goto Main;

    Gasit:
    rezultat = middle;
    goto Return;

    Return:
    return rezultat;
}

