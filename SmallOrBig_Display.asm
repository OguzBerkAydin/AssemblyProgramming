.MODEL SMALL
.STACK 64
.DATA

        NUMBER1 DB ?
        NUMBER2 DB ?
        RESULT DB ?
        
        STR1 DB 'BIG NUMBER $'
        STR2 DB 'SMALL NUMBER $'
        
        ROW DB 10
        COLUMN DB 10 

        
.CODE

        MAIN PROC FAR
            MOV AX,@DATA
            MOV DS,AX
            CALL CLEAR_SCREEN
            CALL CURSOR_POSITION
            
            START:
               
               CALL INPUT
               MOV NUMBER1,AL
               CALL CLEAR_SCREEN
               CALL CURSOR_POSITION 
               
               CMP NUMBER1,30H
               JE END_POINT
               
               CMP NUMBER1,35H
               JBE SMALL
               
            BIG:
                LEA DX,STR1
                CALL PRINT_STR
                JMP START
                
            SMALL:
                LEA DX,STR2
                CALL PRINT_STR
                JMP START
                
            END_POINT:     
                MOV AH,4CH
                INT 21H
                
            MAIN ENDP        
        
        CLEAR_SCREEN PROC    
            
            MOV AX,0600H
            MOV BH,34H
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
       
            
        CURSOR_POSITION PROC
            MOV AH,02
            MOV BH,00
            MOV DH,ROW
            MOV DL,COLUMN
            INT 10H
            RET
            CURSOR_POSITION ENDP
                    
            
             
 
        
        END MAIN