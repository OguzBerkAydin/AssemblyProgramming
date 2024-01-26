.MODEL SMALL
.STACK 64
.DATA

        NUMBER1 DB ?
        NUMBER2 DB ?
        RESULT DB ?
        
        STR1 DB 'NUMBER1: $'
        STR2 DB 'NUMBER2: $'
        STR_RESULT DB 'RESULT: $'
        
        ROW DB 00
        COLUMN DB 00 
        
        CHAR DB ?
        
        RESULT_MSB DB ?
        RESULT_LSB DB ?
        
.CODE

        MAIN PROC FAR
            MOV AX,@DATA
            MOV DS,AX
            
            CALL CLEAR_SCREEN 
            
            LEA DX,STR1
            CALL PRINT_STR
            
            CALL INPUT    
            MOV CHAR,AL
            SUB AL,30H
            MOV NUMBER1,AL
            CALL PRINT_CHR
            
            INC ROW
            CALL CURSOR_POSITION 
            LEA DX,STR2
            CALL PRINT_STR
            
            CALL INPUT
            MOV CHAR,AL
            SUB AL,30H
            CALL PRINT_CHR
            ADD AL,NUMBER1
            ;MOV BL,AL
            
            
            INC ROW
            CALL CURSOR_POSITION
            LEA DX,STR_RESULT
            CALL PRINT_STR
            
            MOV AH,00 
            MOV CL,10
            DIV CL
            
            
            
            ADD AL,30H
            MOV CHAR,AL 
            
            CALL PRINT_CHR 
            
            ADD AH,30H
            MOV CHAR,AH
            
            
            CALL PRINT_CHR
            
            
            
            MOV AH,4CH
            INT 21H
            MAIN ENDP        
        
        CLEAR_SCREEN PROC    
            
            MOV AX,0600H
            MOV BH,07H
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
            MOV AH,09
            INT 21H
            POP AX
            RET 
            
            PRINT_STR ENDP
            
        PRINT_CHR PROC
            
            PUSH AX
            MOV AH,02
            MOV DL,CHAR
            INT 21H   
            POP AX
            RET
            PRINT_CHR ENDP
            
        CURSOR_POSITION PROC
            MOV AH,02
            MOV BH,00
            MOV DH,ROW
            MOV DL,COLUMN
            INT 10H
            RET
            CURSOR_POSITION ENDP
                    
            
             
 
        
        END MAIN