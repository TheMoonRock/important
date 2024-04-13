global	summator

section	.text
summator:	pop		ebx
			pop		eax

			add		eax, ebx
			leave
			ret
