%include "stud_io.inc"
global  _start

section .text; 10-line feed  9-tab  32-space
_start: GETCHAR
        add     ecx, 1
        cmp     eax, 10
        je      nullzero
        cmp     eax, 9
        je      nullzero
        cmp     eax, 32
        je      nullzero

nullzero:
        cmp     ebx, ecx
        jnle    nz
        mov     ebx, ecx

nz:     xor     ecx, ecx
        cmp     eax, 10
        je      fin
        jmp     _start

fin:    cmp     ebx, 0
        je      fin1
        PUTCHAR "*"
        sub     ebx, 1
        jmp     fin
fin1:   FINISH
