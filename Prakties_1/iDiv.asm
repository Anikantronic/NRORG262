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
    mov eax,-20
    cdq
    mov ebx,5
    idiv ebx
    OutputInt eax ;in hierdie geval is daar nie decimaal nie, maar sal moet edx kan vertoon as daar decimaal is, gaan later leer.
    
    ; Always end with an exit function
    Exit 0
    
    ;Vir idiv sal dit so lyk
    ;cdq
    ;mov ebx,5
    ;idiv ebx