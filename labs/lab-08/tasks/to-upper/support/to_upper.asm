section .text

global to_upper

to_upper:
    push rbp
    mov rbp, rsp

    sub rsp, 8              ; leave room in order to align the stack
    push rbx                ; preserve rbx as required by the System V AMD64 ABI

    ; TODO: save the used registers and align the stack, if needed

    mov rax, rdi
    ; TODO: convert the string to uppercase
check_one_byte:
    mov bl, [rax]
    test bl, bl
    je out
    sub bl, 0x20
    mov [rax], bl
    inc rax
    jmp check_one_byte

out:
    ; TODO: restore the used registers and the stack pointer, if altered
    pop rbx
    add rsp, 8

    leave
    ret
