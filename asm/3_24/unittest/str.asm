%include "stud_io.inc"
global	str

section	.data
num11	dd	10
num22	dd	10

section	.text
str:    GETCHAR
        cmp     eax, " "
        je		.some

		cmp		eax, 10
		je		.some1

        sub     eax, 48
        mov     ecx, 10
        mov     ebx, eax

        cmp     esi, 0
        jne     .next
        add     esi, ebx
        jmp     str

.next:   mov     eax, 10
        mul     esi
        add     eax, ebx
        mov     esi, eax

        jmp     str

.some:	mov		[num11],	esi
		jmp		str
		
.some1:	mov		[num22], esi
		jmp		.quit

.quit:	mov		edx, [num11]
		mov		ecx, [num22]
		push	edx
		push	ecx
		ret
