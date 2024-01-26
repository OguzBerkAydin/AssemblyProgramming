.MODEL SMALL
.STACK 64
.DATA
      
      ROW DB 00
      COLUMN DB 00
      STR_TEXT DB 'KASTAMOAA UNIVERSITESI$'
      STR1 DB 'TEXT: $'
      STR2 DB 'HOW MANY 'A': $'
      COUNTER DB 0
      
.CODE

    MAIN PROC FAR
        
        MOV AX,@DATA
        MOV DS,AX
         
        MOV AX,0000H
        
        CALL CLEAR_SCREEN
        LEA DX, STR1
        CALL PRINT_STR
        LEA DX,STR_TEXT
        CALL PRINT_STR
        
        
        LEA SI,STR_TEXT
        MOV CX,22
        ITERATION:
            MOV BL,[SI]
            INC SI
            CMP BL,41H 
            JE ADD_1   
            
            LOOP ITERATION
            JMP END_POINT
            ADD_1:
                
                ADD COUNTER,1
                LOOP ITERATION
             
        END_POINT:
        INC ROW
        CALL CURSOR_POSITION
        LEA DX,STR2
        
        CALL PRINT_STR
        
        MOV AX,0000H
        MOV AH,COUNTER
        
        MOV DL,COUNTER
        ADD DL,30H
        ;LEA DL,COUNTER
        CALL PRINT_CHR
         
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    
    CLEAR_SCREEN PROC
        
        MOV AX,0600H
        MOV BH,74H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        RET
        
        CLEAR_SCREEN ENDP
    
    INPUT PROC
        
        MOV AH,00
        INT 16H
        RET
        
        INPUT ENDP
    
    PRINT_STR PROC 
        PUSH AX
        MOV AH,09H
        INT 21H
        POP AX
        RET
        PRINT_STR ENDP
    
    PRINT_CHR PROC
        
        PUSH AX
        MOV AH,02
        INT 21H  
        POP AX
        RET
        
        PRINT_CHR ENDP 
    
    CURSOR_POSITION PROC
        
        PUSH AX
        MOV AH,02H
        MOV BH,00
        MOV DH,ROW
        MOV DL,COLUMN
        INT 10H     
        POP AX
        RET
        CURSOR_POSITION ENDP
    
    
    END MAIN