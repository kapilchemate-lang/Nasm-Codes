section .data

a db 09H
b db 02H
subresult db 0H

section .bss

section .text

global _start
_start:

mov al,[rel a]
mov bl,[rel b]
sub al,bl
mov [rel subresult],al

mov eax,1
mov ebx,0
int 80h