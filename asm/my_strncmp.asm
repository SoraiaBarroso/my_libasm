section .text
    global _my_strncmp

_my_strncmp:
    mov rax, 0
    mov r10, rdx            ; store the 3rd argument (size_t n)
    dec r10                 ; decrease it by 1 to compare with the index
    ; Arguments:
    ; rdi first param
    ; rsi second param
    ; rdx third param
while:
    mov bl, [rdi + rax]     ; treat the value of rdi as a pointer
    mov cl, [rsi + rax]
    cmp bl, cl              ; compare both chars
    jne not_equal           ; if not equal jump to not_equal
    cmp bl, 0               ; check for null terminador
    je equal                ; if end string, strings are equal
    inc rax
    cmp r10, rax            ; compare max index with the current index
    je equal                ; if reached the end, exit the loop
    jmp while               ; start again

equal:
    xor rax, rax            ; set return value to 0
    ret

not_equal:
    sub bl, cl              ; substract the difference
    movsx rax, bl           
    ret