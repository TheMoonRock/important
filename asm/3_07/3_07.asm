%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        cmp     al, 65
        jne     else_branch
        PRINT   "Yes"
        PUTCHAR 10   
        JMP     if_quit
else_branch:
        PRINT   "NO"
        PUTCHAR 10
if_quit:
        FINISH
