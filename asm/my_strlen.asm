section .text
global _my_strlen 

_my_strlen:
    mov rax, 0          ; long

while:  
    inc rax             ; increment
    inc rdi             ; move char
    cmp [rdi], byte 0   ; check null byte
    jne while           ; jump if not equal

return:
    ret