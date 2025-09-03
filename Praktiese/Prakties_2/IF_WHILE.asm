;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    SPASIE      db " ",0
    VLGLYN      db "",10,0
    BOODSKAP    db "Kliener of gelyk aan 0",0
    BD2         db "Klaar",0
    GETAL       dd 10

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
    InputInt
    cmp eax,0
    jle .ifFalse
    
.ifTrue:
    mov ecx,eax
    jmp .while
    
.ifFalse:
    OutputStr BOODSKAP
    jmp .Einde
 
.while:
    OutputInt ecx
    OutputStr SPASIE
    jecxz .Einde  ;Kyk of ecx gelyk is aan nul
    loop .while ;Minus een vanaf ecx en gaan na geheue adres
	
.Einde:
    OutputStr VLGLYN
    OutputStr BD2
	; Always end with an exit function
	Exit 0