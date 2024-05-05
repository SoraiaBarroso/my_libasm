section .text
    global _my_memmove

_my_memmove:
    xor rcx, rcx

set:
    cmp rdx, rcx
    jle decr
    mov [rdi], sil
    inc rdi
    inc rcx
    jmp set

decr:
    cmp rcx, 0
    je  end
    dec rdi
    dec rcx
    jmp decr

end:
    mov rax, rdi
    ret