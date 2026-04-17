; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
    N: dq 7          ; N-th fibonacci number to calculate

section .text
    global main
    extern printf
# 0 1 1 2 3 5 8 13 21 34 55 89 144
# 0 1 2 3 4 5 6 7  8. 9. 10.11 12
main:
    push rbp
    mov rbp, rsp

    mov rcx, QWORD [N]       ; we want to find the N-th fibonacci number; N = RCX = 7
    PRINTF64 `%d\n\x0`, rcx  ; DO NOT REMOVE/MODIFY THIS LINE

    ; TODO: calculate the N-th fibonacci number (f(0) = 0, f(1) = 1)
    mov rax, 0
    mov rbx, 1
    mov r15, rcx

    iteration:
        mov r9, rax
        add r9, rbx
        mov rax, rbx
        mov rbx, r9
        dec r15
        cmp r15, 0
        je exit
        jg iteration


    exit:
    PRINTF64 `%d\n\x0`, rax
    xor rax, rax

    leave
    ret
