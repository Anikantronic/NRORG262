; program om die volgende wiskundige uitdrukking te evalueer -(x + y - 2z + 1)
%include "IO.inc"
BITS 32

section .data
    L dd 20
    B dd 7
    
section .bss

section .text
    global _start
    
_start:
    push ebp ; This is part of the stack frame. Do not delete these lines
    mov ebp,esp
    ; The custom code code starts, evalueer nou -(x + y - 2z + 1)
    imul eax,[L],7 ;Hierso word alles in eax gestoor waar die tweede komma geheue mag wees en dan die laaste ene 'n direkte getal
    OutputInt eax
    
    ; Always end with an exit function
    mov eax,0
    Exit eax