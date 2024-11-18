section .data
	msg1 db "Seja bem vindo", 0xa
	t_msg1 equ $- msg1
	
	msg2 db "Hoje é dia de assembly", 0xa
	t_msg2 equ $- msg2
	
section .text

global _start:

_start:

	mov rax, 4
	mov rbx, 1
	mov rcx, msg1
	mov rdx, t_msg1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, t_msg2
	int 0x80
	
exit:
	mov rax, 1
	int 0x80
	
	
