;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    arrGetalle dd 16,17,4,3,5,2
    grootte dd 6
    i       dd 0
    j       dd 0
    COMMA   db ",",0

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
	
.forIbegin:
    mov ecx,[i]
    cmp ecx,[grootte]
    jge .forIeinde
    mov ecx,[i]
    inc ecx
    mov [j],ecx
    
.forJbegin:
    mov ecx,[j]
    cmp ecx,[grootte]
    jge .forJeinde
    
    mov ecx,[i]
    mov eax,[arrNum+ecx*4]
    mov ecx,[j]
    mov edx,[arrNum+ecx*4]
    cmp eax,edx
    jle .forJeinde:
    inc dword [j]
    jmp .forJbegin
    
.forJeinde:
    mov edx,[j]
    cmp edx,[grootte]
    jne .ifFalse
    mov ecx,[i]
    mov eax,[arrNum+ecx*4]
    OutputInt eax
    OutputStr COMMA
    
.ifFalse:
    inc dword [i]
    jmp .forIbegin
    
.forIeinde:
	
	; Always end with an exit function
	Exit 0