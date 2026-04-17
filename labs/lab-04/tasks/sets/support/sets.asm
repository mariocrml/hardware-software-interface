; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    FIRST_SET: dq 139   ; The first set
    SECOND_SET: dq 169  ; The second set

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp

    ; The two sets can be found in the FIRST_SET and SECOND_SET variables
    mov rax, QWORD [FIRST_SET]
    mov rbx, QWORD [SECOND_SET]
    PRINTF64 `%u\n\x0`, rax ; print the first set
    PRINTF64 `%u\n\x0`, rbx ; print the second set

    ; TODO1: reunion of the two sets
    mov r12, rax
    or r12, rbx
    PRINTF64 `%u\n\x0`, r12


    ; TODO2: adding an element to a set
    or rax, 768
    PRINTF64 `%u\n\x0`, rax


    ; TODO3: intersection of the two sets
    mov r12, rax
    and r12, rbx
    PRINTF64 `%u\n\x0`, r12


    ; TODO4: the complement of a set
    mov r12, rax
    not r12
    PRINTF64 `%u\n\x0`, r12

    ; TODO5: removal of an element from a set
    mov r13, 1
    not r13
    and rax, r13
    PRINTF64 `%u\n\x0`, rax

    ; TODO6: difference of two sets
    mov r12, rbx
    not r12
    and r12, rax
    PRINTF64 `%u\n\x0`, r12
    xor rax, rax

    leave
    ret
