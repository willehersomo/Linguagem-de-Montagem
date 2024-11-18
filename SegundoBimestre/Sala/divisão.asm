section .data
	msg1 db "Entre com n1: "
	tam_msg1 equ $ - msg1

	msg2 db "Entre com n2: "
	tam_msg2 equ $ - msg2

	msg5 db "Resultado: "
	tam_msg5 equ $ - msg5

	msg6 db " | Resto: "
	tam_msg6 equ $ - msg6

section .bss
	n1 resq 1
	n2 resq 1
	r resq 1
	rt resq 1

section .text

global _start

_start:
	mov rax, 0x4
	mov rbx, 0x1
	mov rcx, msg1
	mov rdx, tam_msg1
	int 0x80

	mov rax, 0x3
	mov rbx, 0x0
	mov rcx, n1
	mov rdx, 2
	int 0x80

	mov rax, 0x4
	mov rbx, 0x1
	mov rcx, msg2
	mov rdx, tam_msg2
	int 0x80

	mov rax, 0x3
	mov rbx, 0x0
	mov rcx, n2
	mov rdx, 2
	int 0x80

	mov rax, 0; igual a 0x0000000000000000. Zera o registrador
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r10, 0

;________________________________

    	; para realizar a divisão com 64 bits é necessário limpar os registradores com (mov rax, 0)
    	; também é necessário subtrair o enter+0 (0000101000110000), pois com a entrada de dados pelo teclado é armazenado o enter na memória. 0x0a30 = enter+0 = 0000101000110000
    	; também é preciso que as variáveis sejam resq (64 bits)

    	; supondo que as entradas sejam 4 e 2

	mov rax, [n1] ; ex: 0000101000110100 (enter+4) dividido por 
	mov r10, [n2] ; ex: 0000101000110010 (enter+2). É dessa forma que rax e rbx recebem os valores 4 e 2 do teclado
	
 	sub rax, 0x0a30 ;aqui é retirado o enter e o "0"
	sub r10, 0x0a30
	
	div r10
	
	add rax, 0x30 ;adiciona o zero em hexa para ser imprimível. Isso é igual ao '0'
	add rdx, 0x0a30 ;aqui é adicionando o "0" junto com o enter (enter+0), colocando o resto para ser imprimível e com quebra de linha
	
	mov [r], rax
	mov [rt], rdx

;______________________________________

	mov rax, 4
	mov rbx, 1
	mov rcx, msg5
	mov rdx, tam_msg5
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, r
	mov rdx, 1
	int 0x80

	mov rax, 4
	mov rbx, 1
	mov rcx, msg6
	mov rdx, tam_msg6
	int 0x80
	
	mov rax, 4
	mov rbx, 1
	mov rcx, rt
	mov rdx, 2 ;faço a impressão de dois bytes para quebrar a linha
	int 0x80

exit:
	mov rax, 1
	int 0x80


