%include "stud_io.inc"
global  _start

section .data
stn db  0

section .bss
num1    resb    10
num2    resb    10

section .text
_start: mov     esi, num1
        xor     ecx, ecx
        xor     edx, edx
        xor     ebp, ebp
st:     GETCHAR
        cmp     al, " "
        je      efn
        mov     [esi], al
        ;PUTCHAR [esi]
        inc     esi
        jmp     st

        ;array has been filled
        ; TODO now we need to change array into registr
        ; 1st and 2nd digits are exeption 

efn:    dec     esi
        mov     edx, [esi]

efn1:   xor     eax, eax
        mov     eax, 10
        dec     esi
        mov     ebp, [esi]
        mul     [ebp]
        add     edx, ebp

tin:    PUTCHAR "*"
        dec     edx
        cmp     edx, 0
        jne     tin

fin:    FINISH
