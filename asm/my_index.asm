section .text
    global _my_index  ; return everything after the char found

_my_index:
    dec rdi           ; index
    xor rax, rax      ; set to 0

while: 
    inc  rdi          ; increment value
    mov  dl, [rdi]    ; copy the byte of data located at the memory address stored in the rdi register into the dl register, retrieve char
    cmp  dl, sil      ; compare to find char
    je   char_found   ; if char is the same and found jump
    cmp  dl, byte 0   ; check if the end of data is reached
    jne  while        ; if not the end continue while
    movsx rax, dl
    ret

char_found:
    mov  rax, rdi     ; move index to rdi

return:
    ret