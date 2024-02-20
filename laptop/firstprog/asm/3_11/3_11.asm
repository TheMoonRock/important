%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        cmp     eax, 10
        je      fin
        cmp     eax, 48 ;сравнили код символа с числом 48
        jnae    _start; переход на мтеку старт в случае мень
        cmp     eax, 57
        jnbe    _start
        sub     eax, 48
        add     ebx, eax
        jmp     _start
fin:    cmp     ebx, 0
        je      fin1
        sub     ebx, 1
        PUTCHAR "*"
        jmp     fin
fin1:   PUTCHAR 10
        FINISH
