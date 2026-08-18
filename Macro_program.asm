section .data

msg db 'Hello world', 10
msglen equ $-msg

section .bss

section .text

global _start

%macro RW 4
mov eax,%1
mov ebx,%2
mov ecx,%3
mov edx,%4
int 80h
%endmacro

_start:

RW 4,1,msg,msglen

mov eax,1
mov ebx,0
int 80h