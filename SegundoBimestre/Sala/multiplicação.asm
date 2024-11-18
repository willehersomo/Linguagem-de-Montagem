section .data

	msg0 db "Insira os valores para o calculo de ax²+bx-c", 0xa 
	t0 equ $ - msg0
	
	msg1 db "A: "
	t1 equ $ - msg1
	
	msg2 db "B: "
	t2 equ $ - msg2
	
	msg3 db "C: "
	t3 equ $ - msg3
	
	msg4 db "X: "
	t4 equ $ - msg4
	
	msg5 db "R: "
	t5 equ $ - msg5
	
section .bss

	a resq 1
	b resq 1
	c resq 1
	x resq 1
	aux resq 1
	aux2 resq 1
	r resq 1
	

section .text

global _start

_start:
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg0
	mov rdx, t0
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg1
	mov rdx, t1
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, a
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 2
	mov rcx, msg2
	mov rdx, t2
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, b
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, t3
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, c
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, t4
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, x
	mov rdx, 2
	int 0x80
	
	mov rax, [x]
	mov r9, [x]
	sub rax, '0'
	sub r9, '0'
	mul r9
	mov r9, [a]
	sub r9, '0'
	mul r9
	mov [aux], rax
	
	mov rax, [x]
	mov r9, [b]
	sub r9, '0'
	sub rax, '0'
	mul r9
	mov [aux2], rax
	
	mov r9, [aux]
	mov r10, [aux2]
	mov r11, [c]
	sub r11, '0'
	add r9, r10
	sub r9, r11
	add r9, '0'
	mov [r], r9
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, t5
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
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
