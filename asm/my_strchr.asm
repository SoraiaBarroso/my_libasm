section .text
    global _my_strchr

_my_strchr:
    dec rdi
    mov rax, 0

while:
    inc rdi
    mov dl, [rdi]
    cmp dl, sil
    je match                ; if match, return pointer to first occurence 
    cmp dl, byte 0          ; check for null terminador
    jne while
    movsx rax, dl 
    ret 

match:
    mov rax, rdi            ; return pointer to the first occurence

return:
    ret