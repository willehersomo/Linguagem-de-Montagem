section .data
	msg1 db "Pts. equipe 1: "
	t_msg1 equ $ - msg1
	
	msg2 db "Pts. equipe 2: "
	t_msg2 equ $ - msg2
	
	msg3 db "Pts. equpe 3: "
	t_msg3 equ $ - msg3
	
	msg4 db "Soma dos pontos: "
	t_msg4 equ $ - msg4
	
	msg5 db "Diferença entre o 1° e ultimo: "
	t_msg5 equ $ - msg5
	
section .bss
	equipe1 resb 1
	equipe2 resb 1
	equipe3 resb 1
	soma resb 1
	diferenca resb 1

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
	
	mov r8, [equipe1]
	mov r9, [equipe2]
	mov r10, [equipe3]
	
	sub r8, '0'
	sub r9, '0'
	sub r10, '0'
	
	add r8, r9
	add r8, r10
	
	add r8, '0'
	
	mov [soma], r8
	
	mov rax, 4
    	mov rbx, 1
    	mov rcx, msg4
    	mov rdx, t_msg4
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
    	
    	mov r8, [equipe1]
    	mov r9, [equipe3]
    	
    	sub r8, '0'
	sub r9, '0'
	
	sub r9, r8
	
	add r9, '0'
	
	mov [diferenca], r9
	
	mov rax, 4
    	mov rbx, 1
    	mov rcx, msg5
    	mov rdx, t_msg5
    	int 0x80
    	
    	mov rax, 4
    	mov rbx, 1
    	mov rcx, diferenca
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
	
	
    	
    	
    	
    	
	
	
	
	
	
	
	
	
