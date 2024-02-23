%include "stud_io.inc"
global  _start

section .data
num1    db  10
nothing dw  0
mulnum  db  0
tmp	db	0
firstnumber	dw	0
ecxstorage	db	0

section .bss
buf1    resb    10

section .text
_start: mov     edi,  buf1
		mov		[nothing], edi
        xor     ecx, ecx
st:     GETCHAR
        cmp     eax, " "
        je      efn
		;собираем числа одним и тем же куском кода по очереди
        ;cmp     eax, 10
        ;je      efnew
        mov     [edi], al
        INC     edi
		inc		byte [ecxstorage]
        xor     eax, eax
        jmp     st

efn:   dec     edi
;Собираем число из массива в EBX
efn1:	xor     ebx, ebx		;обнуляем ebx
		sub		byte [edi], 48	;превращаем код символа в число
        mov     ebx, [edi]		;take next number
        ;inc     ecx				; ECX - place number
		dec		edi
		dec		byte [ecxstorage]
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
		dec		byte [ecxstorage]
		add		[firstnumber], eax

;lfn:	PUTCHAR	"*"
;		dec		byte [firstnumber]
;		cmp		byte [firstnumber], 0
;		jne		lfn

		;inc		ecx

;10x10 ECX раз. Собираем оставшуюся часть числа
		inc		ecx ;ECX = 1

efn3:	xor		eax, eax	;очистка eax
		xor		edx, edx	;очистка edx
		xor		ebx, ebx	;очистка ebx
		mov		eax, 10		;множитель. заносим 10 в eax
		mov		[tmp], ecx
mten:	mul		byte [num1]
		loop	mten
		mov	 ecx, [tmp]
		dec		edi
		sub		byte [edi], 48
		movzx	ebx, byte [edi]
		mul		ebx
		dec		byte [ecxstorage]
;TODO цикл сборки числа
;EDX ??????????
; Сначала тестируем вывод цикла степени (регистр EAX)
; Затем тест цикла сборки числа
; TODO Проверить правильность счётчиков [mulnum], ecx
; edi - buf1 проверить значение выражения
; EDX задействуется в умножении. Происходит конфликт
; TODO EDX:EAX решить проблему с выводом
;for git commit
		mov		ebx, edx
		add		[firstnumber], eax ;даёт бесконечность. Другие регистры дают ноль.

		cmp		byte [ecxstorage], 0
		jne		efn3

lfnmul:	PUTCHAR "*"
		dec		dword [firstnumber]
		cmp		dword [firstnumber], 0
		jne		lfnmul
fin:    FINISH
