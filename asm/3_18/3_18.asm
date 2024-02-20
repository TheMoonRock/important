%include "stud_io.inc"
global  _start

section .text
_start: xor     esi, esi
        xor     ebx, ebx
        xor     eax, eax
        xor     ecx, ecx
        xor     edx, edx

str:    GETCHAR
        cmp     eax, 10
        je      fin

        sub     eax, 48
        mov     ecx, 10
        mov     ebx, eax

        cmp     esi, 0
        jne     next
        add     esi, ebx
        jmp     str

next:   mov     eax, 10
        mul     esi
        add     eax, ebx
        mov     esi, eax

        jmp     str

fin:    cmp     esi, 0
        je      fin1
        PUTCHAR "*"
        sub     esi, 1
        jmp     fin

fin1:   PUTCHAR 10
        FINISH
