.MODEL SMALL
.STACK 64
.DATA

    X DW 3
    Y DW ?
    
.CODE
      
    main PROC FAR
          
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,00H
    
    MOV CX,X
    CMP CX,5
    
    JB LESS  
    
    mov Y,20
    
    LESS:
        MOV Y,10
        
     
        
    MOV BX,Y   
        
    MOV AH,4CH
    INT 21H
    
    main ENDP
    END main        