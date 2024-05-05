section .text
    global _my_strcmp

_my_strcmp:
    mov rax, 0
    ; Arguments:
    ; rdi first param
    ; rsi second param
while:
    mov bl, [rdi + rax]     ; treat the value of rdi as a pointer
    mov cl, [rsi + rax]
    cmp bl, cl              ; compare both chars
    jne not_equal           ; if not equal jump to not_equal
    cmp bl, 0               ; check for null terminador
    je equal                ; if end string, strings are equal
    inc rax
    jmp while               ; start again

equal:
    xor rax, rax            ; set return value to 0
    ret

not_equal:
    sub bl, cl              ; substract the difference
    movsx rax, bl           
    ret