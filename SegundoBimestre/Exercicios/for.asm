section .data
    msg db "Insira o primeiro número: "
    t equ $ - msg

    msg2 db "Insira o segundo número: "
    t2 equ $ - msg2
    
    msg3 db "Primeiro maior que segundo", 0xa
    t3 equ $ - msg3
    
    linha db 0xa
    tl equ $ - linha
    

section .bss
    inicio resq 1
    fim resq 1
    resultado resq 1

section .text

global _start

_start:

    menu:

    mov rax, 4
    mov rbx, 1
    mov rcx, msg
    mov rdx, t
    int 0x80


    mov rax, 3
    mov rbx, 0
    mov rcx, inicio
    mov rdx, 2
    int 0x80

    mov rax, 4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, t2
    int 0x80

    mov rax, 3
    mov rbx, 0
    mov rcx, fim
    mov rdx, 2
    int 0x80
    
    mov r8, [inicio]
    mov r9, [fim]
    
    sub r8, 0x0a00
    sub r9, 0x0a00
    add r8, 0x2000
    add r9, 0x2000
    
    cmp r8, r9
    ja maior
    jb menor
    
    

menor:


    mov [resultado], r8
    
    mov rax, 4
    mov rbx, 1
    mov rcx, resultado
    mov rdx, 2
    int 0x80

    add r8, 0x0000000000000001
    cmp r8, r9
    jbe menor
    ja final
    
    maior:
    
    mov rax, 4
    mov rbx, 1
    mov rcx, msg3
    mov rdx, t3
    int 0x80
    
    jmp menu
    
.exit:
 
final:


    mov rax, 4
    mov rbx, 1
    mov rcx, linha
    mov rdx, 1
    int 0x80
    
    mov rax, 1
    int 0x80

