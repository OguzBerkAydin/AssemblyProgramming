.MODEL SMALL
.STACK 64
.DATA

    array db 5,4,3,2,6,8,1
    
.CODE
      
    main PROC FAR
          
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,00H
    
    mov cx,7
    lea si,array
    
    mov al,[si]
    inc si
    
    iteration:
        cmp al,[si]
        jae jump
        mov al,[si]
    
    jump:
        inc si
        loop iteration
    
    mov bl,al    
        
        
    MOV AH,4CH
    INT 21H
    
    main ENDP
    END main        