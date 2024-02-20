%include "stud_io.inc"
global  _start

section .text
_start: GETCHAR
        cmp     eax, "("
        je      op
        cmp     eax, ")"
        je      cp
        cmp     eax, 10
        je      fin
        jmp     _start

op:     add     ebx, 1
        jmp     cyc

cp:     add     ecx, 1
        jmp     cyc

cyc:    cmp     ebx, ecx
        jnae    f1
        jmp     _start

f1:     PRINT   "NO"
        FINISH

fin:    cmp     ebx, ecx
        jne     finno
        PRINT   "YES"
        FINISH

finno:  PRINT   "NO"
        FINISH
