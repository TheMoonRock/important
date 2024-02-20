%include "stud_io.inc"
global  _start

section .text
_start: xor     ebx, ebx
        xor     ecx, ecx
        xor     edx, edx
st:     GETCHAR
        cmp     eax, 45
        jne     next
        add     ebx, 1
next:   cmp     eax, 43
        jne     nextmove
        add     ecx, 1
nextmove:
        cmp     eax, 10
        jne     st
stars:  cmp     ecx, 1
        je      sp
        sub     ecx, 1
        PUTCHAR "*"
        jmp     stars
sp:     FINISH        
