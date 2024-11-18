section .data
	msg1 db "Insira seu nome: "
	t_msg1 equ $- msg1
	
	msg2 db "Insira seu peso: "
	t_msg2 equ $- msg2
	
	msg3 db "Seu peso é "
	t_msg3 equ $- msg3
	
	msg4 db "kg", 0xa
	t_msg4 equ $- msg4
	
section .bss
	
	peso resb 3
	nome resw 20

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
	mov rdx, 20
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, t_msg2
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, peso
	mov rdx, 3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, nome
	mov rdx, 20
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, t_msg3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, peso
	mov rdx, 3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, t_msg4
	int 0x80
	
exit:
	mov rax, 1
	int 0x80
	
	
	
