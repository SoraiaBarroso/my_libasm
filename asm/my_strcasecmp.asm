section .text
    global _my_strcasecmp

_my_strcasecmp:
    mov rax, -1                  ; init return value
    ; Arguments:
    ; rdi first param
    ; rsi second param

while:
    inc     rax
    mov     cl, [rsi + rax]      ; load the character into register cl
    cmp     cl, 'A'              ; compare char with 'A'
    jge     convert_rsi          ; jump if greater than or equal 'A' (if it is letter, A == 65)
    jmp     check_rdi            ; else jump to check first string

convert_rsi:
   cmp      cl, 'Z'              ; 'Z' == 90
   jg       check_rdi            ; jump if greater than 'Z' (if lower case)
   add      cl, 32               ; convert to lowercase by adding 32 to ASCII value

check_rdi:
    mov     dl, [rdi + rax]      ; load the character from first string into register dl
    cmp     dl, 'A'              ; compare char with 'A'
    jge     convert_rdi          ; jump if greater than or equal 'A' (if letter)
    jmp     compare              ; else jump to compare

convert_rdi:
    cmp     dl, 'Z'              
    jg      compare              ; jump if greater than 'Z' (if lower case)
    add     dl, 32               ; convert to lowercase by adding 32 to ASCII value

compare:
    cmp     dl, cl               ; compare chars from both strings
    jne     return               ; not equal jump to return
    cmp     dl, byte 0           ; check for end of string
    jne     while                ; if its not the end of the string go back to while loop
        
return:
    movzx   rcx, cl              
    movzx   rax, dl     
    sub     rax, rcx             ; substract to get result
    ret