section .data
    store_string times 64 db 0

section .text
extern printf
extern puts
global print_reverse_string

; TODO: add the reverse_string() function
reverse_string:
    push rbp
    mov rbp, rsp

    sub rsp, 8
    push rbx

    mov rax, rdi
    mov rcx, rsi
                            ; rdx = buffer for reversed string
    test rcx, rcx
    jz done

    add rax, rcx
    dec rax

copy_loop:
    mov bl, [rax]
    mov [rdx], bl
    dec rax
    inc rdx
    dec rcx
    jnz copy_loop

done:
    mov byte [rdx], 0

    pop rbx
    add rsp, 8

    leave
    ret

print_reverse_string:
    push rbp
    mov rbp, rsp

    ; TODO: save the used registers and align the stack, if needed
    mov rax, rdi
    mov rcx, rsi

    ; TODO: call the reverse_string() function and print the reversed string
    mov rdi, rax
    mov rsi, rcx
    mov rdx, store_string
    call reverse_string

    mov rdi, store_string
    call puts

    ; TODO: restore the used registers and the stack pointer, if altered

    leave
    ret
