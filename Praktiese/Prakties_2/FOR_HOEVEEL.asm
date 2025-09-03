;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    NEXTLINE db "",10,0
    BOODSKAP db "Hoveel getalle wil jy invoer?",10,0
    FOR1 db "Voer nou ",0
    FOR2 db " getalle in:",10,0
    TOTSIENS db "Totsiens.",0
    SOM db "Som van die getalle: ",0
    GEM db "Gemiddeld van die getalle: ",0
    GETALLE dd 0

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
	OutputStr dword BOODSKAP
	InputInt
	mov [GETALLE],eax
	
	cmp eax,0
	jle .ifFalse
	
.ifTrue:
    OutputStr dword FOR1
    mov eax,[GETALLE]
    OutputInt eax
    OutputStr dword FOR2
    mov ecx,0
    mov edx,[GETALLE]
    
.forBegin:
    InputInt
    add ebx,eax
    inc ecx
    
    cmp ecx,edx
    jl .forBegin


.forEindig:
    OutputStr SOM
    OutputInt ebx
    OutputStr NEXTLINE
    
    cdq
    mov eax,ebx
    idiv ecx
    mov ebx,eax
    
    OutputStr GEM
    OutputInt ebx
    jmp .Eindig

.ifFalse:
    OutputStr dword TOTSIENS
    
.Eindig:
	
	; Always end with an exit function
	Exit 0