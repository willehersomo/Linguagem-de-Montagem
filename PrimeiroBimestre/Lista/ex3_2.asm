section .data
	msg1 db "1. Breno", 0xa
	t_msg1 equ $- msg1
	
	msg2 db "2. Wille", 0xa
	t_msg2 equ $- msg2
	
	msg3 db "3. Bezerra", 0xa
	t_msg3 equ $- msg3
	
	msg4 db "4. Correia", 0xa
	t_msg4 equ $- msg4
	
section .text

global _start

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
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, t_msg3
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, t_msg4
	int 0x80

exit:
	mov rax, 1
	int 0x80
	

	
	
