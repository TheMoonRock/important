%include "stud_io.inc"
global _start

section .text
_start: GETCHAR
        PUTCHAR al
        cmp     eax, 10
        jne _start
        FINISH
