; program om die volgende wiskundige uitdrukking te evalueer -(x + y - 2z + 1)
%include "IO.inc"
BITS 32

section .data
    X dd 5 ;define doubleword = 4 bytes
    Y dd 10
    Z dd 2
    
section .bss

section .text
    global _start
    
_start:
    push ebp ; This is part of the stack frame. Do not delete these lines
    mov ebp,esp
    ; The custom code code starts, evalueer nou -(x + y - 2z + 1)
    mov eax,[X] ;Block hakkies, want anderste stoor ons die addres nie die waarde nie
    add eax,[Y] ;5+10
    mov ebx,eax ;sodat ons eax ander waardes kan gee
    mov eax,2 ;eax = 2
    mul dword [Z] ;dword om die grootte van die geheue te spesifiseer (byte,word,dword). eax * 2 = 2*2 dus eax = 4
    sub ebx,eax ; ebx - eax = 15 - 4 = 11 = ebx
    inc ebx ;kan eers increment na die aftrek, ebx+1 = 12 = ebx
    neg ebx ;- ebx = -12 = ebx
    OutputInt ebx
    
    ; Always end with an exit function
    mov eax,0
    Exit eax