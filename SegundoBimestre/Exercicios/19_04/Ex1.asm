section .data 

	msg1 db "Digite o nome da Empresa: "
	tmsg1 equ $ - msg1
	
	msg2 db "Digite o valor da Acao 1: "
	tmsg2 equ $ - msg2
	
	msg3 db "Digite o valor da Acao 2: "
	tmsg3 equ $ - msg3
	
	msg4 db "Digite o valor da Acao 3: "
	tmsg4 equ $ - msg4
	
	msg5 db "Digite o valor da Acao 4: "
	tmsg5 equ $ - msg5
	
	msg6 db "Digite o valor da Acao 5: "
	tmsg6 equ $ - msg6
	
	msg7 db "Ativo"
	tmsg7 equ $ - msg7
	
	msg8 db " | "
	tmsg8 equ $ - msg8
	
	
	
	
section .bss

	nome resb 10
	v1 resb 1
	v2 resb 1
	v3 resb 1
	v4 resb 1
	v5 resb 1
	media resb 1
	diferenca resb 1 
	numacoes resb 1
	investido resb 1
	ultacoes resb 1
	
section .text

global _start

_start:

	mov rax, 4
	mov rbx, 1
	mov rcx, msg1
	mov rdx, tmsg1
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, nome
	mov rdx, 10
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, tmsg2
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, v1
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, tmsg3
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, v2
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, tmsg4
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, v3
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, tmsg5
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, v4
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg6
	mov rdx, tmsg6
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, v5
	mov rdx, 2
	int 0x80
	
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r10, 0
	
	mov r8, [v1]
	mov r9, [v2]
	mov r10, [v3]
	mov r11, [v4]
	mov r12, [v5]
	
	sub r8, 0xa30
	sub r9, 0xa30
	sub r10, 0xa30
	sub r11, 0xa30
	sub r12, 0xa30
	
	add r8, r9
	add r8, r10
	add r8, r11
	add r8, r12
	
	
	mov rax, r8
	mov r13, '5'
	sub r13, '0'
	div r13
	
	add rax, 0x30
	add rdx, 0x0a30
	
	mov [media], rax
	add r8, 0xa30
	mov [investido], r8
	
	mov r8, [media]
	mov r9, [v5]
	
	sub r8, '0'
	sub r9, '0'
	sub r9, r8
	add r9, '0'

	mov [diferenca], r9
	mov r12, '5'
	mov [numacoes], r12

	mov rax, [numacoes]
	mov r8, [v5]
	sub rax, '0'
	sub r8, '0'
	mul r8
	add rax, '0'
	mov [ultacoes], rax

	
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg7
	mov rdx, tmsg7
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, media
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, v5
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, diferenca
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, numacoes
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, investido
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg8
	mov rdx, tmsg8
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, ultacoes
	mov rdx, 1
	int 0x80
	
exit:
	mov rax, 1 
	int 0x80
