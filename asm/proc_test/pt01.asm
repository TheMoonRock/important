%include "stud_io.inc"
global	_start
extern	summator

section	.text
_start:	mov		eax, 5
		mov		ebx, 5
		
		push	eax
		push	ebx

		call	summator

		mov		ecx, eax

lp:		PUTCHAR	"*"
		loop lp

		FINISH
