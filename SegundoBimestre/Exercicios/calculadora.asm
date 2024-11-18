section .data

    opcao db 0xa, ":"
    top equ $ - opcao
    
    obrigado db 0xa, "Obrigado por usufruir da calculadora :))", 0xa
    thanks equ $ - obrigado
	
    msg0 db 0xa, "A calculadora só suporta números e resultados que estão entre 0 e 9", 0xa, 0xa
    t0 equ $ - msg0
    
    msg1 db 0xa, "Insira o primeiro número: "
    t1 equ $ - msg1
    
    msg2 db "Insira o segundo número: "
    t2 equ $ - msg2
    
    msg3 db "Escolha a operação desejada:"
    t3 equ $ - msg3
    
    msg4 db 0xa, "1 - Soma", 0xa, "2 - Subtração", 0xa, "3 - Multiplicação", 0xa, "4 - Divisão", 0xa, "0 - Sair", 0xa
    t4 equ $ - msg4
    
    msg5 db "Opção inválida", 0xa
    t5 equ $ - msg5
    
    linha db 0xa
    tl equ $ - linha
    
    resu db "Resultado: "
    tresu equ $ - resu
    
    textresto db "Resto da divisão: "
    tresto equ $ - textresto
    
    zero db "Não é possível realizar divisão por zero ", 0xa
    tzero equ $ - zero
    
section .bss
    op resq 1
    n1 resq 1
    n2 resq 1
    resultado resq 1
    resto resq 1
    
section .text

global _start

_start:

inicio:
  
    mov rax, 4
    mov rbx, 1
    mov rcx, msg0
    mov rdx, t0
    int 0x80  	
  	
    mov rax, 4  
    mov rbx, 1
    mov rcx, msg3
    mov rdx, t3
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, msg4
    mov rdx, t4
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, opcao
    mov rdx, top
    int 0x80
   
    mov rax, 3
    mov rbx, 0
    mov rcx, op
    mov rdx, 2
    int 0x80
    
    cmp byte [op], '0'
    je exit
    
    cmp byte [op], '1'
    jb .op_invalida
    cmp byte [op], '4'
    ja .op_invalida
   
    mov rax, 4
    mov rbx, 1
    mov rcx, msg1
    mov rdx, t1
    int 0x80
    
    mov rax, 3
    mov rbx, 0
    mov rcx, n1
    mov rdx, 2
    int 0x80
    
    cmp byte [n1], '0'
    jb .op_invalida
    cmp byte [n1], '9'
    ja .op_invalida
   
    mov rax, 4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, t2
    int 0x80
    
    mov rax, 3
    mov rbx, 0
    mov rcx, n2
    mov rdx, 2
    int 0x80
    
    cmp byte [n2], '0'
    jb .op_invalida
    cmp byte [n2], '9'
    ja .op_invalida
    
    cmp byte [op], '0'
    cmp byte [n2], '0'
    je .divzero
    
    mov r8, [op]
    sub r8, '0'
    
    cmp byte [op], '1'
    je .soma
    cmp byte [op], '2'
    je .subtracao
    cmp byte [op], '3'
    je .multiplicacao
    cmp byte [op], '4'
    je .divisao
    
.divzero:
    
    mov rax, 4
    mov rbx, 1
    mov rcx, zero
    mov rdx, tzero
    int 0x80
    jmp inicio
    
.op_invalida:
    mov rax, 4
    mov rbx, 1
    mov rcx, msg5
    mov rdx, t5
    int 0x80
    jmp inicio

    
.soma:
  
    mov r8, [n1]
    sub r8, '0'
    mov r9, [n2]
    sub r9, '0'
    add r8, r9
    add r8, '0'
    mov [resultado], r8
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, resu
    mov rdx, tresu
    int 0x80
    
    mov rax, 4        
    mov rbx, 1         
    mov rcx, resultado
    mov rdx, 1   
    int 0x80
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    jmp inicio
    
.subtracao:

    mov r8, [n1]
    sub r8, '0'
    mov r9, [n2]
    sub r9, '0'
    sub r8, r9
    add r8, '0'
    mov [resultado], r8
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, resu
    mov rdx, tresu
    int 0x80
    
    mov rax, 4        
    mov rbx, 1         
    mov rcx, resultado
    mov rdx, 1    
    int 0x80
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    jmp inicio
   
    
.multiplicacao:
    mov rax, [n1]
    mov r9, [n2]
    sub rax, '0'
    sub r9, '0'
    mul r9
    add rax, '0'
    mov [resultado], rax
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, resu
    mov rdx, tresu
    int 0x80	
    
    mov rax, 4        
    mov rbx, 1         
    mov rcx, resultado
    mov rdx, 1   
    int 0x80
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    jmp inicio
    
.divisao:
    sub rax, rax 
    sub rbx, rbx
    sub rcx, rcx
    sub rdx, rdx
    sub r9, r9 
    mov rax, [n1]
    mov r9, [n2]
    sub rax, 0x0a30
    sub r9, 0x0a30
    div r9
    add rax, 0x30
    add rdx, 0x0a30
    mov [resultado], rax
    mov [resto], rdx
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, resu
    mov rdx, tresu
    int 0x80
    
    mov rax, 4        
    mov rbx, 1         
    mov rcx, resultado
    mov rdx, 1    
    int 0x80
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    mov rax, 4
    mov rbx, 1
    mov rcx, textresto
    mov rdx, tresto
    int 0x80
    
    mov rax, 4        
    mov rbx, 1         
    mov rcx, resto
    mov rdx, 1 
    int 0x80
    
    mov rax, 4         
    mov rbx, 1         
    mov rcx, linha        
    mov rdx, 1        
    int 0x80
    
    jmp inicio
    
exit:

    mov rax, 4
    mov rbx, 1
    mov rcx, obrigado
    mov rdx, thanks
    int 0x80
    
    mov rax, 1
    int 0x80
