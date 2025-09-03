;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    nommers     dd 47,57,77,3,25,33,32,94,62,31
    som         dd 0
    n           dd 10
    gem         dd 0
    HOOG        db "Hoog",0
    LAAG        db "Laag",0

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
	
	lea ebx,[nommers]
	mov ecx,0
	
.forBegin:
    mov eax,[n]
    cmp ecx,eax
    jge .forEinde
    
    mov eax,[ebx]
    ;OutputInt eax
    add dword [som],eax
    add ebx,4
    inc ecx
    jmp .forBegin

.forEinde:
    mov eax,[som]
    cdq
    mov ebx,10
    div ebx
    
    cmp eax,50
    jle .else
    
    OutputStr HOOG
    jmp .einde
    
.else:
    OutputStr LAAG

.einde:
	
	; Always end with an exit function
	Exit 0