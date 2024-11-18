section .data

    msg1 db "X: "
    t_msg1 equ $ - msg1

    msg2 db "Y: "
    t_msg2 equ $ - msg2
    
    msg3 db  "Z: "
    t_msg3 equ $ - msg3

    msg4 db "Resultado: "
    t_msg4 equ $ - msg4
    

section .bss

    x resb 1
    y resb 1
    z resb 1
    r resb 1

section .text

global _start

_start:

    mov rax, 4
    mov rbx, 1
    mov rcx, msg1
    mov rdx, t_msg1
    int 0x80

    mov rax, 3
    mov rbx, 0
    mov rcx, x
    mov rdx, 2
    int 0x80

    mov rax, 4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, t_msg2
    int 0x80

    mov rax, 3
    mov rbx, 0
    mov rcx, y
    mov rdx, 2
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, msg3
    mov rdx, t_msg3
    int 0x80
    
    mov rax, 3
    mov rbx, 0
    mov rcx, z
    mov rdx, 2
    int 0x80

    mov r8, [x]    
    mov r9, [y]    
    mov r10, [z]  

    sub r8, '0'     
    sub r9, '0'     
    sub r10, '0'    

    add r8, r9     
    sub r8, r10     

    add r8, '0'      

    mov [r], r8     

    mov rax, 4
    mov rbx, 1
    mov rcx, msg4
    mov rdx, t_msg4
    int 0x80

    mov rax, 4
    mov rbx, 1
    mov rcx, r
    mov rdx, 1
    int 0x80

    mov rax, 4
    mov rbx, 1
    mov [rcx], byte 0xa
    mov rdx, 1
    int 0x80

exit:

    mov rax, 1
    int 0x80
