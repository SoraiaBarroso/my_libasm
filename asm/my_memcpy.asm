section .text
    global _my_memcpy

_my_memcpy:
    mov rax, rdi
    ; Arguments:
    ; rdi first param - destination 
    ; rsi second param - source
    ; rdx third param, - num 

while:
    cmp rdx, 0
    je return
    mov cl, [rsi]
    mov byte [rdi], cl 
    inc rdi
    inc rsi
    dec rdx
    jmp while

return:
    ret