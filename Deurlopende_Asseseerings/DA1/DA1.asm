;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    X dd 0
    Y dd 0
    ANTW dd 0
    VRAAG1 db "Voer in twee positiewe heelgetalle, X = ",0
    VRAAG2 db "Voer nou in, Y = ",0
    ANT1 db "Vermenigvuldiging van X en Y = ",0
    ANT2 db "Deeling van Y in X in = ",0
    ANT3 db "Modulus van Y in X in = ",0
    VOLG db "",10,0

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
	OutputStr VRAAG1
	InputInt
	mov [X],eax
	OutputStr VRAAG2
	InputInt
	mov [Y],eax
	
	; Bereken nou die antwoorde
	imul eax,[X]
	mov [ANTW],eax
	OutputStr ANT1
	mov eax,[ANTW]
	OutputUInt eax
	OutputStr VOLG
	
	cdq
	mov ebx,[Y]
	mov eax,[X]
	idiv ebx
	mov [ANTW],eax
	OutputStr ANT2
	mov eax,[ANTW]
	OutputUInt eax
	OutputStr VOLG
	OutputStr ANT3
	OutputInt edx
	
	
	; Always end with an exit function
	mov eax,0
	Exit eax