;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    sum dd 0
    SPASIE db " ",0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

; while (sum < 100){
;    sum++;
;    cout << sum << " ";
;}


_start:                                             ; This is the start label
	push ebp										; This creates a stack frame
	mov ebp,esp										; This is part of the stack frame. Do not delete these lines
	; The custom code code starts
	mov ecx,[sum] ;Gebruik ecx register as 'n teller, c -> counter

.LusBegin: ;Wat ons na toe terug spring terwyl ons in die lus is
    cmp ecx,100 ; dword [sum],100 kan dan mov ecx,[sum] verwyder in lyn 37
    jge .LusEind ;As die som groter is as 100 dan eindig ons die lus
    
    inc dword [sum] ;Inc nie net die greep waarde nie maar die volle doubleword waarde
    OutputInt dword [sum]
    OutputStr SPASIE
    mov ecx,[sum]
    
    jmp .LusBegin ;Terug na die begin van die lus

.LusEind: ;Waarna ons gaan sodra die lus klaar is
	
	; Always end with an exit function
	Exit 0