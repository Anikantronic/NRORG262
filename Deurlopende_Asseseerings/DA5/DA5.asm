%include "IO.inc"

section .data
    INVOER_BOODSKAP db      "Gee die waarde:",0
    DUBBELPUNT      db      ":",0
    NL              db      10,0
    AANTAL_ITERASIE db      "Hoeveel iterasies moet vertoon word:",0
    AANTAL_ELEMENTE db      "Hoeveel elemente moet die skikking bevat:",0

section .bss
    SKIKKING0       resd    100
    SKIKKING1       resd    100  

section .text
	global _start                 
	
;Die funksies kan hier onder geskep word
;===============================================================================
vertoon:

    push ebp
    mov ebp,esp
    pushad
    
    mov ecx,0
    mov ebx,[ebp+8]
.forBegin:
    cmp ecx,[ebp+12]
    jge .forEinde
    
    OutputInt dword [ebx]
    
    add ebx,4
    inc ecx
    jmp .forBegin
    
.forEinde:   
    OutputStr NL
    popad
    mov esp,ebp
    pop ebp
    ret 8
    
;===============================================================================
invoer:

    push ebp
    mov ebp,esp
    pushad
    
    mov ecx,0
    mov ebx,[ebp+8]
.forBegin:
    cmp ecx,[ebp+12]
    jge .forEinde
    
    OutputStr INVOER_BOODSKAP
    InputInt
    mov dword [ebx],eax
    
    add ebx,4
    inc ecx
    jmp .forBegin
    
.forEinde:
    
    popad
    mov esp,ebp
    pop ebp
    ret 8
    
;===============================================================================
uitvee:

    push ebp
    mov ebp,esp
    pushad
    
    mov ecx,0
    mov ebx,[ebp+8]
.forBegin:
    cmp ecx,[ebp+12]
    jge .forEinde
    
    mov dword [ebx],0
    
    add ebx,4
    inc ecx
    jmp .forBegin
    
.forEinde:
    
    popad
    mov esp,ebp
    pop ebp
    ret 8
    
;===============================================================================
omskakel:

    push ebp
    mov ebp,esp
    pushad
    ;[ebp+8] => Bron skikking
    ;[ebp+12] => Bestemming skikking
    ;[ebp+16] => aantal elemente
    mov eax,[ebp+8]
    mov ebx,[ebp+12]
    sub esp,12
    mov ecx,0
    ;[ebp-4]  n-1
    ;[ebp-8]   n
    ;[ebp-12] n+1
    
.forBegin:
    cmp ecx,[ebp+16]
    ;OutputInt ecx
    jge .forEinde
    
    cmp ecx,0
    jne .nieEerste     ;Eerste element kort spesiale geval
    mov dword [ebp-4],0
    jmp .mid
    
.nieEerste:
    sub eax,4
    mov edx,[eax]
    add eax,4
    mov dword [ebp-4],edx
.mid:
    mov edx,[eax]
    mov dword [ebp-8],edx
    
    mov dword edx,[ebp+12]
    dec edx
    cmp ecx,edx
    jne .nieLaaste  ;Laaste element kort spesiale geval
    mov dword [ebp-12],0
    jmp .toetsMid
.nieLaaste:
    add eax,4
    mov edx,[eax]
    sub eax,4
    mov dword [ebp-12],edx
    
.toetsMid: ;Toets nou die elemente
    cmp dword [ebp-8],0
    je .toetsVoor
    
    cmp dword [ebp-4],0 ;Toets nou of n-1 = 0 of nie
    je .isEen
    jmp .isNul

.toetsVoor: 
    cmp dword [ebp-4],0
    jne .isEen

.isNul:
    mov dword [ebx],0
    ;OutputInt dword 0
    jmp .weer

.isEen:
    ;OutputInt dword 1
    mov dword [ebx],1

.weer:
    inc ecx
    add ebx,4
    add eax,4
    jmp .forBegin
    
.forEinde:

    popad
    mov esp,ebp
    pop ebp
    ret 12

;Die funksies kan hier bo geskep word
;Die kode hieronder roep die onderskeie funksies.
;Daar word voorgestel dat van die kode verander word in kommentaar, tot en met die onderskeie funksie geskep is.
_start:                                             
    push ebp 
    mov ebp,esp
    sub esp,12
    ;[ebp-4] Hou die aktiewe skikking 
    ;[ebp-8] Aantal elemente
    ;[ebp-12] Aantal iterasies
    mov dword [ebp-4],0         ; 0 = SKIKKING0. 1 = SKIKKING1
    mov dword [ebp-8],0
    ;Maak beide skikkings skoon
    ;uitvee(Skikking0, TOTAAL_ITEMS);
    push dword 100              ; Die skikkings kan 'n maksimum van 100 items bevat
    push SKIKKING0
    call uitvee
    ;uitvee(Skikking1, TOTAAL_ITEMS);
    push dword 100              ; Die skikkings kan 'n maksimum van 100 items bevat
    push SKIKKING1
    call uitvee
    ;Kry veranderlikes 
    ;System.out.println("Hoeveel elemente moet die skikking bevat:");
    OutputStr AANTAL_ELEMENTE
    ;aantalElemente = input.nextInt();
    InputInt
    mov [ebp-8],eax             ; Stoor in Aantal elemente      
    ;System.out.println("Hoeveel iterasies moet vertoon word:");
    OutputStr AANTAL_ITERASIE
    ;aantalIterasies = input.nextInt();
    InputInt
    mov [ebp-12],eax            ; Stoor in Aantal iterasies
    ;Kry die eerste skikking se waardes
    ;invoer(Skikking0, aantalElemente);
    push dword [ebp-8]
    push SKIKKING0
    call invoer
    ;Vertoon die skikking
    ;vertoon(Skikking0, aantalElemente);
    push dword [ebp-8]
    push SKIKKING0
    call vertoon
    
    ;Maak gereed om die reels toe te pas op die skikkings
    ;for(int i=0;i<aantalIterasies;i++)
    mov ecx,0
.forBegin:
    ;i<aantalIterasies
    cmp ecx,[ebp-12]        ; [ebp-12] aantal iterasies
    jge .forEnd             ; As ecx >= aantal iterasies dan stop ons
    push dword [ebp-8]      ; Aantal elemente
    cmp dword [ebp-4],0     ; Kyk wat is die aktiewe skikking
    jne .skikking1
    ; Verander skikking1 met reels toegepas op skikking0
    ; omskakel(Skikking0, Skikking1, aantalElemente); aantalElemente is reeds hierbo ge-push
    push SKIKKING1
    push SKIKKING0
    call omskakel
    ;Vertoon die nuwe skikking
    ; vertoon(Skikking1,aantalElemente);
    push dword [ebp-8]  ; Aantal elemente 
    push SKIKKING1
    call vertoon
    ;Verander skikking1 as die nuwe aktiewe skikking
    ;aktieweSkikking=1;
    mov dword [ebp-4],1
    jmp .klaarGekies
.skikking1:
    ;Verander skikking0 met reels toegepas op skikking1
    ;omskakel(Skikking1, Skikking0, aantalElemente); aantalElemente is reeds hier bo gepush
    push SKIKKING0
    push SKIKKING1
    call omskakel
    ;Vertoon skikking0
    ;vertoon(Skikking0, aantalElemente);
    push dword [ebp-8]  ; Aantal elemente 
    push SKIKKING0
    call vertoon
    ;Maak skikking0 die nuwe aktiewe skikking
    ;aktieweSkikking=0;
    mov dword [ebp-4],0
.klaarGekies:
    ;Herhaal tot die aantal iterasies klaar is.
    ;i++
    inc ecx 
    jmp .forBegin
.forEnd:

	Exit 0