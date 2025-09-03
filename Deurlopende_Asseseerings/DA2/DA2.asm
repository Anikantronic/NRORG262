;==================This section adds any external referenced documents===================================================
%include "IO.inc"				; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    VLGLYN db "",10,0
    VRAAG db "Hoeveel maande se reënval moet bereken word: ",0
    INVOER1 db "Voer in maand ",0
    INVOER2 db " se lesing: ",0
    DROOG db "	Dit was droog.",0
    MID db "Dit was gemiddeld.",0
    MEER db "Dit was nat",0
    N dd 0
    TOT dd 0

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
	InputInt
	mov [N],eax ;Gebruik om invoer maande te stoor
	mov ecx,0 ;Gebruik om maande te tel
	mov ebx,0 ;Gebruik vir totale reenval
	
.beginFor:
    mov eax,[N]
    cmp ecx,eax
    jge .eindFor
    
    inc ecx
    OutputStr INVOER1
    OutputInt ecx
    OutputStr INVOER2
    InputInt
    add [TOT],eax
    jmp .beginFor
    
.eindFor:
    mov ebx,[TOT]
    OutputInt ebx
    OutputStr VLGLYN
    
    cdq
    mov eax,ebx ;Totaal na eax om mee te deel
    idiv ecx ;Deel totaal met teller van maande
    mov ebx,eax
    OutputInt eax
    OutputStr VLGLYN
    
    cmp ebx,10
    jge .tussenIfElse
    
.minderIf:
    OutputStr dword DROOG
    jmp .Einde

.tussenIfElse:
    cmp ebx,60
    jge .meerElse
    
    OutputStr dword MID
    jmp .Einde

.meerElse:
    OutputStr dword MEER

.Einde:	
	; Always end with an exit function
	mov eax,0
	Exit eax