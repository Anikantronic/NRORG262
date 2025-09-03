;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    arrGetalle  dd 9,3,6,2,1,5,7,8
    grootte     dd 8
    SPASIE      db " ",0
    i           dd 0
    j           dd 0

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
	mov dword [i],0
.forIbegin:
    mov ecx,[i]
    mov eax,[grootte]
    dec eax
    cmp ecx,eax
    jge .forIeinde
    
    mov dword [j],0

.forJbegin:
    mov ecx,[j]
    mov eax,[grootte]
    sub eax,[i]
    dec eax
    cmp ecx,eax
    jge .forJeinde
    
    mov eax,[arrGetalle+ecx*4] ;arr[j]
    ; inc ecx -> maak uitruil later moeilik so los dit doen liewers +4 in die volgende lyn
    mov edx,[arrGetalle+ecx*4+4] ;arr[j+1]
    
    cmp eax,edx
    jle .ifFalse 
    mov [arrGetalle+ecx*4],edx ;Ruil nou die eintlike geheue waardes
    mov [arrGetalle+ecx*4+4],eax ;Kort nie temp omdat ons die geheue oorskryf
    ;Nie nodig omdat .ifFalse nou gaan uitvoer, wat in elk geval hierdie kode is
    ;inc dword [j]
    ;jmp .forJbegin

.ifFalse:
    inc dword [j]
    jmp .forJbegin

.forJeinde:
    inc dword [i]
    jmp .forIbegin

.forIeinde:
    ;Will nou die array uitdruk
    mov dword [i],0
    lea ebx,[arrGetalle] ; Laai arrGetalle se eerste waarde in ebx in
.forVertoon:
    mov ecx,[i]
    cmp ecx,[grootte]
    jge .forKlaar
    
    OutputInt dword [ebx]  ;Vertoon die eintlikke geheue adress in arrGetalle
    OutputStr SPASIE
    
    add ebx,4  ;Volgende getal is 4 busse weg
    inc dword [i]
    jmp .forVertoon

.forKlaar:
	
	; Always end with an exit function
	Exit 0