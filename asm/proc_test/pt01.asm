%include "stud_io.inc"
global	_start
extern	summator

section	.text
_start:	mov		edx, 5
		mov		ebx, 5

		call	summator

lp:		cmp		ebx, 0
		je		fin
		PUTCHAR	'*'
		dec		ebx
		jmp		lp

fin:	FINISH
