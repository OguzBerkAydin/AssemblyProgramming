.MODEL SMALL
.STACK 64
.DATA

  
  ROW DB 00
  COLUMN DB 00
  
  NAME1 DB 'OGUZ$' 
  CHAR DB ?
  SAYAC DB 4
        
.CODE

        MAIN PROC FAR
                MOV AX,@DATA
                MOV DS,AX
                               
                    MOV AX,00           
                    ;LEA SI,NAME1
                    CALL CLEAR_SCREEN
                    CALL CURSOR_POSITION
                    
                    MOV CX,4 
                    T2:
                      ;MOV SI,DX
                      LEA SI,NAME1
                      PUSH CX
                        TEKRAR:
                            MOV DL,[SI]
                            CALL PRINT_CHR
                            INC SI
                            LOOP TEKRAR
                            INC ROW
                            CALL CURSOR_POSITION
                            POP CX
                            DEC CX
                            CMP CX,0H
                            JE END_POINT
                            JMP T2
                            
                    END_POINT:                
                        
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