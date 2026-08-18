section .data

a db 09H
b db 02H
quotient db 0H
remainder db 0H

section .bss

section .text

global _start
_start:

mov al,[rel a]
mov ah,0
mov bl,[rel b]

div bl

mov [rel quotient],al
mov [rel remainder],ah

mov eax,1
mov ebx,0
int 80h