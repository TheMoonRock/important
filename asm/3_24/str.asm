%include "stud_io.inc"
global	str

section	.text
str:    GETCHAR
        cmp     eax, " "
        je		.quit

		cmp		eax, 10
		je		.quit

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

		jmp		str

.quit:	ret
