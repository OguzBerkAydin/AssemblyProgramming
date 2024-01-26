.model
.stack 64
.data
    
    RESULT DW ?
    
.code

    MAIN PROC FAR
        MOV AX, @DATA
        MOV DS,AX
        
        MOV AX,00H
        MOV CX,100
        
        ITERATION:
            ADD AX,CX
            LOOP ITERATION   
            MOV RESULT,AX
            
        MOV AH,4CH
        INT 21H  
        
        MAIN ENDP
        END MAIN
            
                
