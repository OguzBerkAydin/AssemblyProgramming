.MODEL SMALL
.STACK 64
.DATA
       
        STR1 DB 'NAME: $'
        STR2 DB 'NO: $'
        
        
        ROW DB 00
        COLUMN DB 00 
        
        CHAR DB ?

        STR3 DB '                 $'
        NUMARA DB '           $'
        

        
.CODE

        MAIN PROC FAR
            MOV AX,@DATA
            MOV DS,AX
            
            CALL CLEAR_SCREEN
            LEA DX,STR1
            CALL PRINT_STR 
            LEA SI,STR3
            START:
            CALL INPUT
            CMP AL,0DH
            JE STEP2  
            
            
            
            MOV [SI],AL
            INC SI
             
            
            LEA DL,AL     
            
            
            
            CALL PRINT_CHR
            JMP START
            
            STEP2:
            MOV ROW,12
            MOV COLUMN,5
            CALL CURSOR_POSITION
            LEA DX,STR3
            CALL PRINT_STR
            MOV ROW,01
            MOV COLUMN,00
            CALL CURSOR_POSITION
            LEA DX,STR2
            CALL PRINT_STR
            
            LEA SI,NUMARA
            
            
            START2:
            CALL INPUT
            CMP AL,0DH
            JE STEP3  
            
            
            
            MOV [SI],AL
            INC SI
             
            
            LEA DL,AL     
            
            
            
            CALL PRINT_CHR
            JMP START2
            
             
            STEP3:
            MOV ROW,13
            MOV COLUMN,5
            CALL CURSOR_POSITION
            LEA DX,NUMARA
            CALL PRINT_STR
            
            
           
            
            
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
