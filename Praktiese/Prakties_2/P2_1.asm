;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    VRAAG db "Voer in 'n getal:",0
    ANT1 db "Hallo",0
    ANT2 db "Almal",0
    SPASIE db "",10,0

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
	OutputStr dword VRAAG
	InputInt
	
	cmp eax,1
	je .ifTrue
.ifFalse:
    OutputStr dword ANT2
    jmp .ifEnd

.ifTrue:
    OutputStr dword ANT1
    
.ifEnd:
	
	; Always end with an exit function
	Exit 0