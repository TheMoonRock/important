%include "stud_io.inc"
global  _start

section .text
_start: mov eax, 46
        mov ecx, 10
        div ecx
        add al, 48
        add ah, 48
        add dl, 48
        add dh, 48
;        PUTCHAR al
        PUTCHAR ah
        PUTCHAR dl
        PUTCHAR dh
        FINISH        
