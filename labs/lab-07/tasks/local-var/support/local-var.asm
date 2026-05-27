%include "printf64.asm"

%define ARRAY_1_LEN 5
%define ARRAY_2_LEN 7
%define ARRAY_OUTPUT_LEN 12

section .data

array_1 dd 27, 46, 55, 83, 84
array_2 dd 1, 4, 21, 26, 59, 92, 105


section .text

extern printf
global main
main:
    push rbp
    mov rbp, rsp

    sub rsp, 4 * ARRAY_1_LEN
    and rsp, -16  ;; Align the stack to 16 bytes

    mov rdi, 0
copy_array_1_to_stack:
    mov ecx, [array_1 + 4 * rdi]
    mov [rsp + 4 * rdi], ecx
    inc rdi
    cmp rdi, ARRAY_1_LEN
    jl copy_array_1_to_stack

    mov r8, rsp

    sub rsp, 4 * ARRAY_2_LEN
    and rsp, -16  ;; Align the stack to 16 bytes

    mov rdi, 0
copy_array_2_to_stack:
    mov ecx, [array_2 + 4 * rdi]
    mov [rsp + 4 * rdi], ecx
    inc rdi
    cmp rdi, ARRAY_2_LEN
    jl copy_array_2_to_stack

    mov r9, rsp

    sub rsp, 4 * ARRAY_OUTPUT_LEN
    and rsp, -16  ;; Align the stack to 16 bytes
    mov r10, rsp

    mov rax, 0
    mov rbx, 0
    mov rcx, 0

merge_arrays:
    cmp rax, ARRAY_1_LEN
    jge copy_array_2
    cmp rbx, ARRAY_2_LEN
    jge copy_array_1

    mov edx, [r8 + 4 * rax]
    mov edi, [r9 + 4 * rbx]
    cmp edx, edi
    jg array_2_lower
array_1_lower:
    mov [r10 + 4 * rcx], edx
    inc rax
    inc rcx
    jmp merge_arrays
array_2_lower:
    mov [r10 + 4 * rcx], edi
    inc rbx
    inc rcx
    jmp merge_arrays

copy_array_1:
    cmp rax, ARRAY_1_LEN
    jge print_array
    mov edx, [r8 + 4 * rax]
    mov [r10 + 4 * rcx], edx
    inc rax
    inc rcx
    jmp copy_array_1

copy_array_2:
    cmp rbx, ARRAY_2_LEN
    jge print_array
    mov edx, [r9 + 4 * rbx]
    mov [r10 + 4 * rcx], edx
    inc rbx
    inc rcx
    jmp copy_array_2

print_array:
    PRINTF64 `Array merged:\n\x0`
    xor rcx, rcx

print:
    mov edx, [r10 + 4 * rcx]
    PRINTF64 `%d \x0`, rdx
    inc rcx
    cmp rcx, ARRAY_OUTPUT_LEN
    jb print

    PRINTF64 `\n\x0`
    xor rax, rax
    mov rsp, rbp

    leave
    ret
