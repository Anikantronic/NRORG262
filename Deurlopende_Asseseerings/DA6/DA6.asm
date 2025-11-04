;==================This section adds any external referenced documents===================================================
%include "IO.inc"				; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    POR1 db "Voer 'n sin in: ", 0
    NL db 10, 0
;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
    BRON1 resb 500
    BESTEMMING1 resb 500
    BRON2 resb 500
    BESTEMMING2 resb 500
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found
verklein:
    push ebp
    mov ebp, esp
    
    sub esp, 4
    
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    pushfd
    
    mov dword [ebp-4], 0 ; bestemming teller
    
    mov esi, [ebp+8] ; bron
    mov edi, [ebp+12] ; bestemming
    mov edx, [ebp+16] ; aantal
    
    mov ecx, 0
.while_begin:
    mov al, byte [esi+ecx]
    cmp ecx, edx
    jge .while_end
    
    cmp eax, '0'
    jl .spasies
    
    cmp eax, '9'
    jg .spasies
    
    mov ebx, dword [ebp-4]
    mov byte [edi+ebx], al
    inc dword [ebp-4]
    
    jmp .skip_letters
    
.spasies:
    ; spasie
    cmp eax, ' '
    jne .letters
    
    mov ebx, dword [ebp-4]
    mov byte [edi+ebx], al
    inc dword [ebp-4]
    
    jmp .skip_letters
    
.letters:
    ; letters (hoof en klein)
    ; klein
    cmp eax, 'a'
    jl .continue
    
    cmp eax, 'z'
    jg .skip_letters
    
    mov ebx, dword [ebp-4]
    mov byte [edi+ebx], al
    inc dword [ebp-4]
    
    jmp .skip_letters
    
.continue:
    ; groot
    cmp eax, 'A'
    jl .skip_letters
    
    cmp eax, 'Z'
    jg .skip_letters
    
    add eax, 32
    
    mov ebx, dword [ebp-4]
    mov byte [edi+ebx], al
    inc dword [ebp-4]
    
.skip_letters:
    inc ecx
    jmp .while_begin
.while_end:
    
    popfd
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    mov esp, ebp
    pop ebp
    
    ret 12
    
verleng:
    push ebp
    mov ebp, esp
    
    push eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    pushfd
    
    mov esi, [ebp+8] ; bron
    mov edi, [ebp+12]
    
    mov eax, 0
    mov ecx, 0
.while1: ; Deur posisies
    cmp ecx, [ebp+16]
    jge .while1_end
    
    mov dl, byte [esi+ecx]
    
    mov ebx, 0
.while2:
    cmp ebx, ecx
    jg .while2_end
    
    mov byte [edi+eax], dl
    
    inc eax
    inc ebx
    jmp .while2
.while2_end:
    
    inc ecx
    jmp .while1
    
.while1_end:
    
    popfd
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    mov esp, ebp
    pop ebp
    
    ret 12
    
_start:                                             ; This is the start label
	push ebp
	mov ebp, esp
	;
	OutputStr POR1
	InputStr BRON1, 500
	sub eax, 1
	
	push eax
	push BESTEMMING1
	push BRON1
	call verklein
	
	OutputStr POR1
	InputStr BRON2, 500
	sub eax, 1
	
	push eax
	push BESTEMMING2
	push BRON2
	call verleng
	
	OutputStr NL
	OutputStr BESTEMMING1
	OutputStr NL
	OutputStr BESTEMMING2
	; Always end with an exit function
	mov eax,0
	Exit eax