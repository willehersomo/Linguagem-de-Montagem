section .data
	msg db "Insira inicio: "
	t  equ $ -msg
	
	msg2 db "Insira final: "
	t2  equ $ -msg
	
	linha db 0xa
	tl equ $ - linha
	
sectio.bss
	inicio resq 1
	fim resq 1
	atual resq 1

section .text

global_start

_start:

    mov rax, 4
    mov rbx, 1
    mov rcx, msg
    mov rdx, t1
    int 0x80
   
    mov rax, 3
    mov rbx, 0
    mov rcx, inicio
    mov rdx, 2
    int 0x80
    
    cmp byte [inicio], '0'
    jb .op_invalida
    cmp byte [inicio], '9'
    jb .op_invalida
    
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
    
    cmp byte [fim], '0'
    jb .op_invalida
    cmp byte [fim], '9'
    jb .op_invalida
    
    
    
