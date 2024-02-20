%include "stud_io.inc"
global  _start

section .text
_start: mov     eax, 0
cycle:  cmp     eax, -1
        je      cycle_quit
        GETCHAR     ; something


        PUTCHAR [eax]


        JMP cycle
cycle_quit:
        FINISH
