section .data
	msg db 10,13,9,'Addition is:'
        msglen: equ $-msg
	global x	
     x:
       db 1
       db 2
       db 3
       db 2
       db 2
   sum:
       db 0
	
section .text
global _start
_start:

	mov eax,4     
	mov ebx,1       
	mov ecx,msg     
	mov edx,msglen  
	int 80h
	
	mov eax,x	
	mov ebx,0      
	mov ecx,5	
      t:
         add ebx,[eax]  
         add eax,1	
         loop t         
         
         cmp bl,9       
         jna t1    
         add bl,07     
     t1: add bl,30h     
         
         mov [sum],bl   
             
         mov edx,1      
         mov ecx,sum    
         mov eax,4      
         mov ebx,1      
         int 80h
	 	
                    
         mov eax,1      
         mov ebx,0     
         int 80h