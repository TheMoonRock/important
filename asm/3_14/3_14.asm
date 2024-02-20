%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        add     ecx, 1
        cmp     eax, 10
        je      fin
        cmp     eax, 32
        je      fin
        cmp     eax, 9
        je      fin
        jmp     _start

fin:    cmp     eax, 10
        je      fin2
        cmp     ebx, ecx
        jnae    fin1
        xor     ecx, ecx
        jmp     _start

fin1:   mov     ebx, ecx
        xor     ecx, ecx
        jmp     _start

fin2:   cmp     ebx, ecx
        jnae    fin3
        mov     edx, ecx
        jmp     final1

fin3:   mov     ebx, ecx
        mov     edx, ecx
        jmp     final1

final1: cmp     ebx, 1
        je      final2_2
        sub     ebx, 1
        PUTCHAR "*"
        jmp     final1

final2_2:
        PUTCHAR 10
        jmp     final2

final2: cmp     edx, 1
        je      final3
        sub     edx, 1
        PUTCHAR "*"
        jmp     final2

final3: PUTCHAR 10
        jmp     _start
