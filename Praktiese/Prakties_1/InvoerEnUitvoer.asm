%include "IO.inc"
BITS 32

section .data
    POR1 db "Voer 'n Getal in: ",0
    ANT1 db "Die antwoord is: ",0
    
section .bss

section .text
    global _start
    
_start:
    push ebp ; This is part of the stack frame. Do not delete these lines
    mov ebp,esp
    ; The custom code code starts
    OutputStr POR1
    InputInt ;word terug gegee in eax, OutputStr verander ook eax
    imul eax,7 ;kon mul, maar sou 7 in 'n register moes laai. Invoer maal 7 word dan in eax gestoor
    mov ebx,eax ;want OutputStr wat volg gaan eax verander na 0
    OutputStr ANT1
    OutputInt ebx ; vertoon nou ebx!
    
    ; Always end with an exit function
    Exit 0