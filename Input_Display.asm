section .data

msg db 'Enter your name', 10
msglen equ $-msg

msg1 db 'Enter rollno', 10
msg1len equ $-msg1

msg2 db 'Your name', 10
msg2len equ $-msg2

msg3 db 'Your Rollno', 10
msg3len equ $-msg3


section .bss

name resb 30
roll resb 15


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

; Input Name
RW 4,1,msg,msglen
RW 3,0,name,30

; Input Roll Number
RW 4,1,msg1,msg1len
RW 3,0,roll,15

; Display Name
RW 4,1,msg2,msg2len
RW 4,1,name,30

; Display Roll Number
RW 4,1,msg3,msg3len
RW 4,1,roll,15

; Exit
mov eax,1
mov ebx,0
int 80h