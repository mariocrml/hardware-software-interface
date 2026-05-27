section .text
global rot13

rot13:
    push rbp
    mov rbp, rsp

    ; TODO: save the used registers and align the stack, if needed
    mov rcx, rsi
    mov rsi, rdi

    ; TODO: implement the rot13 function
loop:
    cmp rcx, 0
    je done

    mov al, [rsi]
    cmp al, 0
    je handle_null

    cmp al, 'a'
    jl check_upper
    cmp al, 'z'
    jg check_upper

    sub al, 'a'
    add al, 13
    cmp al, 26
    jl lower_store
    sub al, 26

lower_store:
    add al, 'a'
    mov [rsi], al
    jmp next

check_upper:
    cmp al, 'A'
    jl next
    cmp al, 'Z'
    jg next

    sub al, 'A'
    add al, 13
    cmp al, 26
    jl upper_store
    sub al, 26

upper_store:
    add al, 'A'
    mov [rsi], al

next:
    inc rsi
    dec rcx
    jmp loop

handle_null:
    cmp byte [rsi + 1], 0
    je done
    mov byte [rsi], ' '
    inc rsi
    jmp loop

done:
    ; TODO: restore the used registers and the stack pointer, if altered

    leave
    ret
