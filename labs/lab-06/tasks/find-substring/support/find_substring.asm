; SPDX-License-Identifier: BSD-3-Clause

%include "printf64.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES
substring: db "BABC", 0 ; DO NOT MODIFY THIS LINE EXCEPT FOR THE STRING IN QUOTES

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
global main
main:
    push rbp
    mov rbp, rsp

    ; TODO: Print the start indices for all occurrences of the substring in source_text
    mov r8, source_text
    mov r9, substring

source_loop:
    mov rax, r8
    mov rdx, r9

substr_loop:
    cmp byte [rdx], 0
    je found_substr
    mov bl, byte [rax]
    cmp byte [rdx], bl
    jne exit_substr_loop
    inc rax
    inc rdx
    jmp substr_loop

found_substr:
    push rax
    push rdx
    push r8
    push r9
    mov rsi, r8
    sub rsi, source_text
    mov rdi, print_format
    xor al, al
    call printf
    pop r9
    pop r8
    pop rdx
    pop rax

exit_substr_loop:
    inc r8
    cmp byte [r8], 0
    je exit
    jmp source_loop

exit:
    leave
    ret
