%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        cmp     eax, 10
        jne next
        PRINT   "OK"
        PUTCHAR 10
        JMP     _start
next:   JMP     _start
