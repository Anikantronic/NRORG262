;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    PORBOODSKAP db "Hallo rekenaar",10,0 ;d-data, maw ons stoor iets, b-byte dan die string/characters, dan komma nul, omdat die nul dit eindig(nul-terminated)
    ; ,10,0 die 10 is 'n carridge return dit is basies enter
	BOODSKAP2 db "Dit is Jaco.",10,0
	STELLING db "Die krag wat die aarde op my uitvoer in Newton's is: ",0
	
	A dd 10
	M dd 71
    
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
	OutputStr PORBOODSKAP
	OutputStr BOODSKAP2
	
	mov eax,[A]
	mul dword [M]
	mov ebx,eax
	OutputStr STELLING
	OutputInt ebx
	; Always end with an exit function
	Exit 0