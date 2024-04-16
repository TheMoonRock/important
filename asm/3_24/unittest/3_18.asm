%include "stud_io.inc"
global  _start
extern	str

section	.data
num1	dd	10
num2	dd	10

resadd	dd	10
ressub	dd	10
resmul	dd	10

section	.bss
raa	resb	10
rsa	resb	10
rma	resb	10

section .text
_start: xor     esi, esi
        xor     ebx, ebx
        xor     eax, eax
        xor     ecx, ecx
        xor     edx, edx
; ут надо передать адресс начала строки через подпрограмму вида [eax+8] и длину строки
; длину строки передать как колво элементов массив

fu:		call	str
		pop		ecx
		pop		edx

; TEST OUTPUT of numbers
;fin:    cmp     dword [num2], 0
 ;       je      fin1
  ;      PUTCHAR "*"
   ;     sub     dword [num2], 1
    ;    jmp     fin


clear:	xor		esi, esi
		xor		eax, eax
		xor		ebx, ebx
		xor		ecx, ecx
		xor		edx, edx
		xor		ebp, ebp
		xor		edi, edi

;ra rs rm
ra:		mov		eax, [num1]
		mov		ebx, [num2]
		add		eax, ebx
		mov		[resadd], eax
		xor		eax, eax
		xor		ebx, ebx

;fin:    cmp     dword [resadd], 0
 ;       je      fin1
  ;      PUTCHAR "*"
   ;     sub     dword [resadd], 1
    ;    jmp     fin

rs:		mov		eax, [num1]
		mov		ebx, [num2]
		sub		eax, ebx
		mov		[ressub], eax
		xor		eax, eax
		xor		ebx, ebx

;fin:    cmp     dword [ressub], 0
 ;       je      fin1
  ;      PUTCHAR "*"
   ;     sub     dword [ressub], 1
    ;    jmp     fin

rm:		mov		eax, [num1]
		mov		ebx, [num2]
		mul		ebx
		mov		[resmul], eax
		xor		eax, eax
		xor		ebx, ebx

;fin:    cmp     dword [resmul], 0
 ;       je      fin1
  ;      PUTCHAR "*"
   ;     sub     dword [resmul], 1
    ;    jmp     fin

raon:	mov		edi, raa
		mov		eax, [resadd]
		xor		ebp, ebp

raod:	mov		ecx, 10
		div		ecx
		mov		[edi], edx
		inc		edi
		xor		edx, edx
		inc		ebp
		cmp		eax, 0
		je		raof
		jmp		raod

raof:	dec		edi
		dec		ebp
		mov		edx, [edi]
		add		edx, 48
		PUTCHAR	dl
		cmp		ebp, 0
		jne		raof

		PUTCHAR	10
clear1:	xor		esi, esi
		xor		eax, eax
		xor		ebx, ebx
		xor		ecx, ecx
		xor		edx, edx
		xor		ebp, ebp
		xor		edi, edi

rson:	mov		edi, rsa
		mov		eax, [ressub]
		xor		ebp, ebp

rsod:	mov		ecx, 10
		div		ecx
		mov		[edi], edx
		inc		edi
		xor		edx, edx
		inc		ebp
		cmp		eax, 0
		je		rsof
		jmp		rsod

rsof:	dec		edi
		dec		ebp
		mov		edx, [edi]
		add		edx, 48
		PUTCHAR	dl
		cmp		ebp, 0
		jne		rsof

		PUTCHAR	10
clear2:	xor		esi, esi
		xor		eax, eax
		xor		ebx, ebx
		xor		ecx, ecx
		xor		edx, edx
		xor		ebp, ebp
		xor		edi, edi

rmon:	mov		edi, rma
		mov		eax, [resmul]
		xor		ebp, ebp

rmod:	mov		ecx, 10
		div		ecx
		mov		[edi], edx
		inc		edi
		xor		edx, edx
		inc		ebp
		cmp		eax, 0
		je		rmof
		jmp		rmod

rmof:	dec		edi
		dec		ebp
		mov		edx, [edi]
		add		edx, 48
		PUTCHAR	dl
		cmp		ebp, 0
		jne		rmof

		PUTCHAR	10
clear3:	xor		esi, esi
		xor		eax, eax
		xor		ebx, ebx
		xor		ecx, ecx
		xor		edx, edx
		xor		ebp, ebp
		xor		edi, edi



fin1:   FINISH
