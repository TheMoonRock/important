%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        cmp     eax, 10
        je      next
