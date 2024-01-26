.MODEL SMALL
.STACK 64
.DATA

      
    
.CODE
      
    MAIN PROC FAR
          
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,00
    
    mov cx,9 
    iteration:
    mov ax,cx
    and ax,8
    cmp ax,8 
    jne iteration  
    add bx,cx
    
    not1: 
        loop not1
      
        
        
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
    END MAIN        
