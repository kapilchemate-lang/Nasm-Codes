section .data

msg1 db 'Enter first number: '
msg1len equ $-msg1

msg2 db 'Enter second number: '
msg2len equ $-msg2

msg3 db 'Addition is: '
msg3len equ $-msg3

newline db 10


section .bss

a resb 2
b resb 2
sum resb 1


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


RW 4,1,msg1,msg1len
RW 3,0,a,2


mov al,[a]
sub al,30H
mov [a],al



RW 4,1,msg2,msg2len
RW 3,0,b,2


mov bl,[b]
sub bl,30H
mov [b],bl



mov al,[a]
mov bl,[b]
add al,bl

mov bl,al



cmp bl,09H
jbe digit


add bl,37H
jmp store

digit:
add bl,30H

store:
mov [sum],bl



RW 4,1,msg3,msg3len
RW 4,1,sum,1
RW 4,1,newline,1



mov eax,1
mov ebx,0
int 80h