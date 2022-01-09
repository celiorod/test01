.section .text
.global pontuacao

#  int pontuacao(unsigned int exame)
pontuacao:
# exame in %rdi 
    push     %rdi 
    push     %rcx
    push     %rbx
    push     %rdx
    push     %r10

    movq     $0,%rax    # result global
    movq     $3,%rbx    # loop first 3 groups
    
loopg1:
    movq     $0,%rdx    # save temp group result
    movq     $8,%rcx    # bits first group  

loop1:                  # detect bits
    shr     %rdi         # rotate right one bit
    jae     endloop1
    add     $2,%rdx
endloop1:
    sub     $1,%rcx
    cmp     $0,%rcx
    jne     loop1
    call    chkabove3
above3:
    add     %rdx,%rax
    sub     $1,%rbx
    cmp     $0,%rbx
    jne     loopg1
    mov     %rdi,%r10
    and     $0x0f,%rdi      # group 5
    mov     %rdi,%rdx
    call    chkabove3
    add     %rdx,%rax
    mov     %r10,%rdi
    shr     $4,%rdi
    mov     %rdi,%rdx
    call    chkabove3
    add     %rdx,%rax
end:
    pop     %r10
    pop     %rdx        # restore values
    pop     %rbx
    pop     %rcx
    pop     %rdi
    ret                 # exit function
chkabove3:
    cmp     $3,%rdx
    jge     chkabove3a
    pop     %rax
    mov     $0,%rdx
    mov     $0,%rax
    jmp     end
chkabove3a:
    ret     # exit sub
