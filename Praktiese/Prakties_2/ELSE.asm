;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    VRAAG db "Tik 0 of 1: ",10,0 ; 10 is die new line character
    ANT1 db "Hallo",0
    ANT2 db "almal",0
    ANT3 db "Gaan weg ",0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

_start:                                             ; This is the start label
	push ebp										; This creates a stack frame
	mov ebp,esp										; This is part of the stack frame. Do not delete these lines
	; The custom code code starts
	OutputStr VRAAG
	InputInt   ;antwoord word in eax gestoor
	;If stelling wat volg
	xor ebx,ebx ;om ebx 0 te maak, wat ons wil mee vergelyk
	cmp eax,ebx
	jne .HalloFalse
	
;Die twee etikette
.HalloTrue:
    OutputStr ANT1
    jmp .HalloEnd
.HalloFalse:
    OutputStr ANT3
    ;geen jmp hierso nodig nie

.HalloEnd:
    OutputStr ANT2
	
	; Always end with an exit function
	Exit 0