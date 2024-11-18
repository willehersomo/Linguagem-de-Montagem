section .data
	msg1 db "Pts. equipe 1: "
	t_msg1 equ $- msg1
	
	msg2 db "Pts. equipe 2: "
	t_msg2 equ $- msg2
	
	msg3 db "Pts. equipe 3: "
	t_msg3 equ $- msg3
	
	msg4 db "Pts. equipe 4: "
	t_msg4 equ $- msg4
	
	msg5 db "Soma das diferenças: "
	t_msg5 equ $- msg5
	
	
section .bss
	equipe1 resb 1
	equipe2 resb 1
	equipe3 resb 1
	equipe4 resb 1
	diferenca1 resb 1
	diferenca2 resb 1
	diferenca3 resb 1
	soma resb 1

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
	mov rcx, equipe1
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg2
	mov rdx, t_msg2
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, equipe2
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg3
	mov rdx, t_msg3
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, equipe3
	mov rdx, 2
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg4
	mov rdx, t_msg4
	int 0x80
	
	mov rax, 3
	mov rbx, 0
	mov rcx, equipe4
	mov rdx, 2
	int 0x80
	
	mov r8, [equipe1]
	mov r9, [equipe2]
	
	sub r8, '0'
	sub r9, '0'
	
	sub r8, r9
	add r8, '0'
	
	mov [diferenca1], r8
	
	mov r10, [equipe2]
	mov r11, [equipe3]
	
	sub r10, '0'
	sub r11, '0'
	
	sub r10, r11
	add r10, '0'
	
	mov [diferenca2], r10
	
	mov r12, [equipe3]
	mov r13, [equipe4]
	
	sub r12, '0'
	sub r13, '0'
	
	sub r12, r13
	add r12, '0'
	
	mov [diferenca3], r12
	
	mov r14, [diferenca1]
	mov r15, [diferenca2]
	mov r13, [diferenca3]
	
	sub r14, '0'
	sub r15, '0'
	sub r13, '0'
	
	add r14, r15
	add r14, r13
	
	add r14, '0'
	
	mov [soma], r14
	
	mov rax, 4
	mov rbx, 1
	mov [rcx], byte 0xa
	mov rdx, 1
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, t_msg5
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, soma
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
	
	
	
	
	
	
	
	
	
