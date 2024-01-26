.MODEL SMALL
.STACK 64
.DATA

.CODE       
    ANA PROC FAR
        
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV CX,100
    MOV AX,0
    
    iteration:
        ADD BX,CX
        DEC CX
        
        CMP CX,5
        JAE iteration
        
        MOV AH,4CH
        INT 21H
        
    ANA ENDP
    END ANA    