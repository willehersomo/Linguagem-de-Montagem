section .data

	msg1 db "Bom dia", 0xa
	t_msg1 equ $- msg1
	

section .text

global _start:

_start:

	mov rax, 4
	mov rbx, 1
	mov rcx, msg1
	mov rdx, t_msg1
	int 0x80
	
exit:
	mov rax, 1
	int 0x80
