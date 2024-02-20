%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        
        sub     eax, 48

        mov     ecx, 10
        mul     ecx
vng:    cmp     eax, 0
        je      fin
        sub     eax, 1
        PUTCHAR "*"
        jmp     vng

fin:    FINISH

