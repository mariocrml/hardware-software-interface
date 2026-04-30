section .text

extern puts
global print_string

print_string:
    push rbp
    mov rbp, rsp

    ; TODO: save the used registers and align the stack, if needed

    ; TODO: print the string

    ; TODO: restore the used registers and the stack pointer, if altered
    call puts
    leave
    ret
