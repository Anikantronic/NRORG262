;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    VRAAG   db "Voer in 'n desimale heelgetal in: ",0
    HER     db "Wil u die program weer hardloop?(0-Stop,Enige getal-Ja): ",0
    FOUT    db "fout",0
    NL      db "",10,0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

_start:                                             ; This is the start label
	push ebp
	mov ebp,esp
	sub esp,4
	
	;Vra vir invoer
	OutputStr VRAAG
	InputInt
	mov [ebp-4],eax
	
	;Toets die invoer
	cmp eax,0
	jl .fout
    cmp eax,0
    je .nul
    
	;Verander nou in binere waarde in
	mov ecx,0
.while:
    cmp eax,0
    jle .whileVertoon

    inc ecx
    xor edx,edx
    mov ebx,2
    div ebx
    
    cmp edx,0
    je .resNul
    mov ebx,1
    push ebx
    jmp .while
    
.resNul:
    mov ebx,0
    push ebx
    jmp .while
    
	;Vertoon nou die binere waarde
.whileVertoon:
    cmp ecx,0
    jle .herhaal
    pop eax
    OutputInt eax
    dec ecx
    jmp .whileVertoon

.nul:
    cmp eax,0
    jp .fout
    OutputInt eax

.herhaal:
    OutputStr NL
    OutputStr HER
    InputInt
    cmp eax,0
    jne _start
    
    jmp .einde

.fout:
    ;OutputStr NL
    OutputStr FOUT

.einde:    
    mov esp,ebp
	pop ebp
	; Always end with an exit function
	mov eax,0
	Exit eax