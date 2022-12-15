org 100h

.data

  BOARD DB 0,1,2,3,4,5,6,7,8,9


.code



check proc
  mov ax,@data
  mov ds,ax  
    
     mov dh,1
L0:  mov cl,dh
     mov dl,0
L1:  mov al,BOARD[cl]
     inc cl
     mov bl,BOARD[cl]
     cmp al,bl
     jne next1
     inc dl
     cmp dl,2
     jne L1
     jmp R1 
           
 
next1:
      cmp cl,9
      je cond2
      add dh,3
      jmp L0


cond2:   mov dh,1
   L2:   mov cl,dh
         mov dl,0
   L3:   mov al,BOARD[cl]
         add cl,3
         mov bl,BOARD[cl]
         cmp al,bl
         jne next2
         inc dl
         cmp dl,2
         jne L3
         jmp R1 
           
 
next2:
      cmp cl,9
      je cond3
      inc dh
      jmp L2 
      
      
 
cond3:   mov dh,1
   L4:   mov cl,dh
         mov dl,0
   L5:   mov al,BOARD[cl]
         add cl,4
         mov bl,BOARD[cl]
         cmp al,bl
         jne cond4
         inc dl
         cmp dl,2
         jne L5
         jmp R1
         
         
         
cond4:   mov dh,3
   L4:   mov cl,dh
         mov dl,0
   L5:   mov al,BOARD[cl]
         add cl,2
         mov bl,BOARD[cl]
         cmp al,bl
         jne final
         inc dl
         cmp dl,2
         jne L5
         jmp R1 


final:  jmp isEmpty
        cmp ax,1
        je  R3
        jmp R2    
    
 R1:
    mov ax,1
    endp
 R2:
    mov ax,0 
    endp
 R3:
    mov ax,1
    neg ax 
    endp


  