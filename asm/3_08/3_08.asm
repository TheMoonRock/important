%include "stud_io.inc"
global  _start

section .text
_start: mov     eax, 0
        GETCHAR
        cmp     eax, 48
        jnge    low_number      ;   else

        cmp     eax, 57
        jnle    low_number  ;   else

        sub     eax, 48

cycle:  cmp     eax, 0
        je      low_number
        PUTCHAR   42
        sub     eax, 1
        JMP     cycle
low_number:
        PUTCHAR 10
        FINISH
