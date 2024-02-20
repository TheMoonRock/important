%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        add     ecx, 1
        cmp     eax, 10
        jne next
cycle:  cmp     ecx, 0
        je      _start
        sub     ecx, 1
        PUTCHAR "*"
        JMP     cycle
next:   JMP     _start
