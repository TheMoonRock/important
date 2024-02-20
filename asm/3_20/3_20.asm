%include "stud_io.inc"
global  _start

section .data
num1    db  10
nothing db  0
mulnum  db  0
firstnumber	db	0

section .bss
buf1    resb    10

section .text
_start: mov     edi,  buf1
        xor     ecx, ecx
st:     GETCHAR
        cmp     eax, " "
        je      efn
		;собираем числа одним и тем же куском кода по очереди
        ;cmp     eax, 10
        ;je      efnew
        mov     [edi], al
        INC     edi
        xor     eax, eax
        jmp     st

efn:   dec     edi
;Собираем число из массива в EBX
efn1:	xor     ebx, ebx		;обнуляем ebx
		sub		byte [edi], 48	;превращаем код символа в число
        mov     ebx, [edi]		;take next number
        ;inc     ecx				; ECX - place number
		dec		edi

		mov		[firstnumber], EBX ;Заносим EBX в переменную и освобод. регистр

;lfntmp:	PUTCHAR	"*"
;		dec		byte [firstnumber]
;		cmp		byte [firstnumber], 0
;		jne		lfntmp

;first digit alrady in EBX
;собираем второе число из массива

efn2:	xor		eax, eax ;очищаем EAX
		xor		ebx, ebx ;очищаем EBX
		mov		eax, 10	 ; Множитель
		sub		byte [edi], 48	;Превращаем код символа в число
		movzx		ebx, byte [edi] ; ????? Вроде как преобразование данных
		mul		ebx		 ; умножаем ebx на 10(eax)

		add		[firstnumber], eax

;lfn:	PUTCHAR	"*"
;		dec		byte [firstnumber]
;		cmp		byte [firstnumber], 0
;		jne		lfn

		;inc		ecx

;10x10 ECX раз. Собираем оставшуюся часть числа
		inc		ecx ;ECX = 1

efn3:	xor		eax, eax
		xor		ebx, ebx
		mov		eax, 10
		dec		edi
		sub		byte [edi], 48
		movzx	ebx, byte [edi]
		mul		ebx
;TODO цикл степени 10
;TODO цикл сборки числа
		add		[firstnumber], eax

		inc		ecx

fin:    FINISH
