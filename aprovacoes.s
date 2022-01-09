# .section .data
# notapositiva:
#    .int    39      # nota positiva quando superior a este valor
.section .text
.global aprovados
#   int aprovados(unsigned int *exames, int n, unsigned int *aprovados). 
aprovados:
# *exames in %rdi, n in %rsi, *aprovados in %rdx 
    push    %rdi
    push    %rsi
    push    %rdx
    push    %rbx

    mov     $0,%rax
    sub     $1,%rsi
loop1:    
    movl     $0,(%rdx,%rsi,4)
    movl    (%rdi,%rsi,4),%ebx
    cmp     $39,%ebx
    jbe     endloop
    movl    %ebx,(%rdx,%rsi,4)
    inc     %rax
endloop:
    sub     $1,%rsi
    cmp     $0,%rsi
    jge      loop1
end:
    pop     %rbx
    pop     %rdx
    pop     %rsi
    pop     %rdi
    ret
