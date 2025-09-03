;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    BDSKP1       db "Verlangde uitset: ",0
    BDSKP2       db "Vervaardigings getal: ",0
    BDSKP3       db "Vervaardigings tyd: ",0
    ANTW         db "Aantal lyne: ",0

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

_start:
    push ebp
    mov ebp,esp
    ;Allokeer spasie vir lokale veranderlike
    sub esp,12      ;[ebp-4]    verlangdeUitset
                    ;[ebp-8]    vervaardigingsGetal
                    ;[ebp-12]   vervaardigingsTyd
                    
    OutputStr BDSKP3 ;Vervaardigings tyd inlees
    InputInt 
    mov [ebp-12],eax
    OutputStr BDSKP2 ;Vervaardigings getal inlees
    InputInt 
    mov [ebp-8],eax
    OutputStr BDSKP1 ;Verlangde uitset inlees
    InputInt 
    mov [ebp-4],eax
    
    ; vervaardigingsTyd*verlangdeUitset
    mov eax,[ebp-4]
    imul eax,[ebp-12]
    push eax        ;Stoor dit tydelik op die stapel, nie nodig om dit in 'n register te stoor nie
    
    ;vervaardingsGetal*60
    mov eax,[ebp-8]
    imul eax,60
    mov ebx,eax ;Stoor antwoord in ebx
    pop eax     ;Kry voorige antwoord in eax
    xor edx,edx
    div ebx
    mov ebx,eax ;Skuif weer in ebx sodat ons kan OutputStr
    
    OutputStr ANTW
    OutputInt ebx

	mov esp,ebp
	pop ebp
	; Always end with an exit function
	Exit 0