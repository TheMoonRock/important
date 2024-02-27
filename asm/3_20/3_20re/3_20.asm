%include "stud_io.inc"
global  _start

section	.data
num1	db	32
num2	db	32

section	.bss

section .text
_start: xor     esi, esi
        xor     ebx, ebx
        xor     eax, eax
        xor     ecx, ecx
        xor     edx, edx

str:    GETCHAR
        cmp     eax, " "
        je      fin1
		cmp		eax, 10
		je		fin2

        sub     eax, 48
        mov     ecx, 10
        mov     ebx, eax

        cmp     esi, 0
        jne     next
        add     esi, ebx
        jmp     str

next:   mov     eax, 10
        mul     esi
        add     eax, ebx
        mov     esi, eax

        jmp     str

;fin:    cmp     esi, 0
;        je      fin1
;        PUTCHAR "*"
;        sub     esi, 1
;        jmp     fin

fin1:   mov		[num1], esi
test1:	PUTCHAR	"*"
		dec		byte [num1]
		cmp		byte [num1], 0
		je		test1
		jmp		str

fin2:	mov		[num2], esi
; TODO проверить правильность сборки обоих чисел
;add1:	mov	eax, [num1]
;		mov	ebx, [num2]
;		add		eax, ebx



finfin:	PUTCHAR 10
		FINISH
