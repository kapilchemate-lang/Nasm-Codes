section .data

msg db 'hello world', 10
msg1 db 'Kapil', 10

msglen equ $-msg
msg1len equ $-msg1

section .bss

section .text

global _start
_start:
mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, msglen
int 80h

mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, msg1len
int 80h

mov eax ,1
mov ebx ,0
int 80h
