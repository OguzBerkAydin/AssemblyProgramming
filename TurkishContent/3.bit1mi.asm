.MODEL SMALL
.STACK 64
.DATA

      dizi dw 1,2,3
    
.CODE
      
    ANA PROC FAR
          
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,00H
    
    mov cx,9 
    tekrar:
    mov ax,cx
    and ax,8
    cmp ax,8 
    jne birdegil  
    add bx,cx
    
    birdegil: 
        loop tekrar
      
        
        
    MOV AH,4CH
    INT 21H
    
    ANA ENDP
    END ANA        