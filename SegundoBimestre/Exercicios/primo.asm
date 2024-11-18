section .data

mensagem_inicio db "Insira inicio: ", 0
tam_mensagem_inicio equ $ - mensagem_inicio

mensagem_fim db "Insira final: ", 0
tam_mensagem_fim equ $ - mensagem_fim

nova_linha db 0xA

section .bss

inicio resb 2
fim resb 2
resultado resb 1

section .text

global _start

_start:

    ; Imprime mensagem de início
    mov rax, 4
    mov rbx, 1
    mov rcx, mensagem_inicio
    mov rdx, tam_mensagem_inicio
    int 0x80

    ; Lê o valor de início
    mov rax, 3
    mov rbx, 0
    mov rcx, inicio
    mov rdx, 2
    int 0x80

    ; Imprime mensagem de fim
    mov rax, 4
    mov rbx, 1
    mov rcx, mensagem_fim
    mov rdx, tam_mensagem_fim
    int 0x80

    ; Lê o valor de fim
    mov rax, 3
    mov rbx, 0
    mov rcx, fim
    mov rdx, 2
    int 0x80

    ; Converte os valores lidos de ASCII para inteiros
    mov r8, [inicio]
    sub r8, '0'
    mov r9, [fim]
    sub r9, '0'

proximo_numero:
    cmp r8b, r9b
    jg exit

    call eh_primo
    cmp rax, 1
    jne nao_primo

    ; Converte o número primo de volta para ASCII e imprime
    mov r10, r8
    add r10, '0'
    mov [resultado], r10

    mov rax, 4
    mov rbx, 1
    mov rcx, resultado
    mov rdx, 1
    int 0x80

    ; Imprime nova linha
    mov rax, 4
    mov rbx, 1
    mov rcx, nova_linha
    mov rdx, 1
    int 0x80

nao_primo:
    inc r8
    jmp proximo_numero

eh_primo:
    mov rax, 1
    cmp r8, 2
    jl nao_primo_jmp

    mov r10, 2
loop_primo:
    ; Salva r8b em r11b e zera rdx para div
    mov r11, r8
    xor rdx, rdx
    div r10
    ; Verifica se houve resto zero
    cmp rdx, 0
    je nao_primo_jmp
    inc r10b
    ; Se r10b * r10b > r11, não é primo
    cmp r10, r11
    jl loop_primo

fim_primo:
    jmp retornar_de_eh_primo

nao_primo_jmp:
    mov rax, 0

retornar_de_eh_primo:
    jmp retornar_para_proximo_numero

retornar_para_proximo_numero:
    jmp proximo_numero

exit:
    mov rax, 1
    mov rbx, 0
    int 0x80

