;==================This section adds any external referenced documents===================================================
%include "IO.inc"				; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    n           dd 0
    i           dd 0
    j           dd 0
    KOMMA       db ",",0
    NL          db "",10,0
    VRAAG       db "Hoeveel getalle moet ingevoer word: ",0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
    skikking resd 20
    
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

_start:                                             ; This is the start label
	push ebp										; This creates a stack frame
	mov ebp,esp										; This is part of the stack frame. Do not delete these lines
	; The custom code code starts 
	;OutputStr VRAAG
	InputInt
	
	mov dword [n],eax
	mov ecx,0
	lea ebx,[skikking]
	OutputStr NL
	
.forInBegin:
    cmp ecx,[n]
    jge .forInEinde
    
    InputInt
    mov dword [ebx],eax
    add ebx,4
    inc ecx
    jmp .forInBegin

.forInEinde:

    mov dword [i],0
    lea ebx,[skikking]
.forOnVertoon:
    mov ecx,[i]
    cmp ecx,[n]
    jge .forOnKlaar
    OutputInt dword [ebx]
    OutputStr KOMMA
    ;OutputStr NL
    
    add ebx,4
    inc dword [i]
    jmp .forOnVertoon

.forOnKlaar:
	
	lea ebx,[skikking]
	mov dword [i],0
.forIbegin:
    mov ecx,[i]
    mov eax,[n]
    dec eax
    cmp ecx,eax
    jge .forIeinde
    
    mov dword [j],0
.forJbegin:
    mov ecx,[j]
    mov eax,[n]
    sub eax,[i]
    dec eax
    cmp ecx,eax
    jge .forJeinde
    
    mov eax,[skikking+ecx*4]
    mov edx,[skikking+ecx*4+4]
    
    cmp eax,edx
    jle .ifFalse
    
    mov [skikking+ecx*4],edx
    mov [skikking+ecx*4+4],eax

.ifFalse:
    inc dword [j]
    jmp .forJbegin

.forJeinde:
    inc dword [i]
    jmp .forIbegin

.forIeinde:
    ;Wil nou die array vertoon
    mov dword [i],0
    lea ebx,[skikking]
.forVertoon:
    mov ecx,[i]
    cmp ecx,[n]
    jge .forKlaar
    OutputInt dword [ebx]
    OutputStr KOMMA
    ;OutputStr NL
    
    add ebx,4
    inc dword [i]
    jmp .forVertoon

.forKlaar:
	
	; Always end with an exit function
	mov eax,0
	Exit eax