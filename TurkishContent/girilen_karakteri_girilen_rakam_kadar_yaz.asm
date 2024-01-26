.MODEL SMALL
.STACK 64
.DATA

        NUMBER1 DB ?
        NUMBER2 DB ?
        RESULT DB ?
        
        STR1 DB 'KARAKTER GIR: $'
        STR2 DB 'SAYI GIR: $'
        STR_RESULT DB 'RESULT: $' 
        STR_CHOOSE db 'PRESS 0 TO QUIT PRESS 1 TO CONTINUE: $'
        
        ROW DB 00
        COLUMN DB 00 
        
        CHAR DB ?
        
        RESULT_MSB DB ?
        RESULT_LSB DB ?
        
.CODE

        MAIN PROC FAR
            MOV AX,@DATA
            MOV DS,AX
            
            START:
            CALL CLEAR_SCREEN
            MOV ROW,00
            MOV COLUMN,00
            CALL CURSOR_POSITION
            LEA DX,STR1
            CALL PRINT_STR
            
            CALL INPUT
            LEA DL,AL
            MOV CHAR,AL
            ;ADD DL,30H
            CALL PRINT_CHR
            
            INC ROW
            CALL CURSOR_POSITION
            LEA DX,STR2
            CALL PRINT_STR
            
            CALL INPUT
            MOV CL,AL
            
            LEA DL,AL
            CALL PRINT_CHR
            
            SUB CL,30H
            MOV ROW,12
            MOV COLUMN,5
            CALL CURSOR_POSITION
            MOV DL,CHAR
            TEKRAR:
                
                CALL PRINT_CHR
                     LOOP TEKRAR
            
            MOV ROW,03
            MOV COLUMN,00
            CALL CURSOR_POSITION
            LEA DX,STR_CHOOSE
            CALL PRINT_STR 
            
            CALL INPUT
            CMP AL,30H
            JNE START
            
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
            MOV AH,09
            INT 21H
            POP AX
            RET 
            
            PRINT_STR ENDP
            
        PRINT_CHR PROC
            
            PUSH AX
            MOV AH,02
            ;MOV DL,CHAR
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