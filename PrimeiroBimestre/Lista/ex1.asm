section .data
	msg db "Resultado: "
	t_msg equ $ - msg
	
section .bss
	re resb 1

section .text


global _start:

_start:
	
	sub rax, rax
	mov ax, 0011110101100110b
	mov ah, 00000000b
	mov al, 00110000b
	mov [re], rax
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, t_msg
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, re
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

