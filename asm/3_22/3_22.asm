%include "stud_io.inc"
global	_start

section	.text
_start:	xor		eax, eax
		xor		ebx, ebx
st:		GETCHAR
		cmp		eax, 10
		je		next
		push	eax
		inc		ebx
		jmp		st

next:	pop		eax
		PUTCHAR	al
		dec		ebx
		cmp		ebx, 0
		je		fin
		jmp		next

fin:	PUTCHAR	10
		FINISH
