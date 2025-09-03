;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    BDSKP1 db "Watter student se punt moet verander (1-10): ",0
    BDSKP2 db "Wat is die nuwe punt: ",0
    BDSKP3 db "Wil u weer hierdie hardloop(Ja=1,Nee=0):"
    NWLN db 10,0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
    klas resd 10 ;reserveer plek vir 10 dwords in die geheue, hierdie is 'n unassigned array. Sal in .data wees as ons datapunte het.
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

_start:                                             ; This is the start label
	push ebp										; This creates a stack frame
	mov ebp,esp										; This is part of the stack frame. Do not delete these lines
	; The custom code code starts
	
	;Vra vir die student se nommer om te verander
	OutputStr BDSKP1
	InputInt        ;eax het nou die studente nmr
	mov edx,eax
	OutputStr BDSKP2
	InputInt
	lea ebx,[klas]  ; Of: mov ebx,klas
	dec edx         ;Verander nou die gegewe nr na 'n index(indexes begin by 0)
	imul edx,4
	add ebx,edx     ;ebx het nou die adres van die element in die skikking
	;mov dword [klas + 4 * eax] -> Kan die adres waarde so ook bereken.
	mov [ebx],eax
	
	
	;Vertoon die skikking op die skerm
	;for(int n=0;n<10;n++){
	;       System.out.println((n+1) + ":" + klas[n]);    
	;}
	mov ecx,0 ;Ander manier: Kan dan lyn 53 verwyder
	;mov edx,klas
.forBegin:
    cmp ecx,10
    jge .forEind
    ;mov eax,[edx] deel van ander manier
    
    mov eax,[klas + 4 * ecx]
    OutputInt eax
    OutputStr NWLN
    
    inc ecx
    ;add edx,4 As ander manier doen
    jmp .forBegin

.forEind:
    OutputStr BDSKP3
    InputInt
    cmp eax,0
    jne _start
	
	; Always end with an exit function
	Exit 0