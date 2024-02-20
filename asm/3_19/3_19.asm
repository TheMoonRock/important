%include "stud_io.inc"
global  _start

section .bss
buf resb    10

section .text
_start: GETCHAR
        cmp     al, 10
        je      next
        add     ecx, 1
        jmp     _start

next:   mov     edi, buf
        mov     eax, ecx
        xor     ebp, ebp

divid:  mov     ecx, 10
        div     ecx
        mov     [edi], dl
        inc     edi
        add     dl, 48
        PUTCHAR dl
        PUTCHAR 10
        xor     dl, dl
        add     ebp, 1
        cmp     eax, 0
        je      fin
        jmp     divid

fin:    dec     edi
        dec     ebp
        mov     edx, [edi]
        add     dl, 48
        PUTCHAR dl
        cmp     ebp, 0
        jne     fin
        
fin1:   PUTCHAR 10
        FINISH
