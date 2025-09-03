;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    BOODSKAP db "Reeks getalle van 1 tot 50:",10,0
    SPASIE db " ",0
    VYFTIG dd 50
    
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
	;OutputStr dword BOODSKAP
	mov ecx,1
	
.forBegin:
    cmp ecx,51
    jge .forEinde
    
    OutputInt ecx
    OutputStr SPASIE
    inc ecx
    jmp .forBegin

.forEinde:
	
	; Always end with an exit function
	Exit 0