%include "stud_io.inc"
global  _start

section .text
_start: xor     ebx, ebx
        xor     ecx, ecx
        xor     edx, edx
cycle:  GETCHAR
        cmp     eax, 45
        jne     check_plus
        add     ebx, 1
        jmp     cycle
check_plus:
        cmp     eax, 43
        jne     next
        add     ecx, 1
        jmp     cycle
next:
        cmp     eax, 10
        jne     cycle
        mov     eax, ecx
        mul     ebx
nc:     cmp     ax, 0
        je      FIN
        PUTCHAR     "*"
        sub     ax, 1
        jmp     nc
FIN:    FINISH

