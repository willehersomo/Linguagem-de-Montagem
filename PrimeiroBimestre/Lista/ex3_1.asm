section .data

	msg1 db "Insira seu nome: "
	t_msg1 equ $- msg1
	
	
section .bss

	nome resw 256
	
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
	mov rcx, nome
	mov rdx, 256
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, nome
	mov rdx, 256
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80
	
exit:
	mov rax, 1
	int 0x80
	
