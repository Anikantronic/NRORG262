%include "IO.inc"
BITS 32

section .data
    C dd 20
    
section .bss

section .text
    global _start
    
_start:
    push ebp ; This is part of the stack frame. Do not delete these lines
    mov ebp,esp
    ; The custom code code starts, evalueer nou F = (9/5)*C + 32
    imul eax,[C],9
    ;om div te gebruik moet ons eers edx skoonmaak, hierdie moet altyd gebeur voor div
    xor edx,edx ;enige xor met homself gee nul, mov vat langer
    mov ebx,5
    div ebx
    add eax,32
    OutputInt eax ;in hierdie geval is daar nie decimaal nie, maar sal moet edx kan vertoon as daar decimaal is, gaan later leer.
    
    ; Always end with an exit function
    Exit 0
    
    ;Vir idiv sal dit so lyk
    ;cdq
    ;mov ebx,5
    ;idiv ebx