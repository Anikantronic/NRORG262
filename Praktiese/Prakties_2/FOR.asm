;==================This section adds any external referenced documents===================================================
%include "IO.inc"								; Include the 32bit Linux IO library
BITS 32												; Include the 32bit Linux IO library

;==================This section stores our declared const variables =========================================================
section .data
    SPASIE      db " ",0
    EINDBOOD    db "Einde van die lus"

;==================Here we create variables where we reserve space (Normally for arrays or characters =================
section .bss
        
;=============This section is where we will put the code===============================================================
section .text
	global _start                                   ; It is recommended to start with a _start label using the global declaration
													; Leave this line alone, otherwise the linker may not know where the first instruction can be found

; for(int n=0; n<10; n++){
;    cout << n << " ";
;}


_start:                                             ; This is the start label
	push ebp										; This creates a stack frame
	mov ebp,esp										; This is part of the stack frame. Do not delete these lines
	; The custom code code starts
	mov ecx,0
	
.BeginFor:
    cmp ecx,10
    jge .EindFor ;jge want moet by 9 stop, <10
    OutputInt ecx
    OutputStr SPASIE
    inc ecx
    jmp .BeginFor
    
    ;jecxz .forEnd jump when ecx equals zero
    ;loop .forBegin trek een van ecx af , gebruik wanneer n--

.EindFor:
    OutputStr EINDBOOD
	
	; Always end with an exit function
	Exit 0