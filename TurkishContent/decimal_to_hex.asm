.MODEL SMALL
.STACK 64
.DATA

  row db 00
  column db 00
  char db 0
  num1 db ?
  num2 db ?
        
.CODE

        MAIN PROC FAR
            MOV AX,@DATA
            MOV DS,AX

                
                CALL CLEAR_SCREEN
                CALL CURSOR_POSITION
                CALL INPUT
                
                MOV NUM1,AL
                MOV DL,AL
                CALL PRINT_CHR
                
                CALL INPUT
                
                MOV NUM2,AL
                MOV DL,AL
                CALL PRINT_CHR
                
                SUB NUM1,30H
                SUB NUM2,30H
                
                MOV AL,NUM1
                MOV BL,10
                MUL BL
                
                ADD AL,NUM2
                MOV AH,0
                
                MOV BL,16
                DIV BL
                
                MOV NUM1,AL
                MOV NUM2,AH
                
                INC ROW
                CALL CURSOR_POSITION
                
                CMP NUM1,0AH
                JAE EKLE
                ADD NUM1,30H
                JMP ATLA
                
                EKLE:
                    ADD NUM1,37H
                
                ATLA:
                    MOV DL,NUM1
                    CALL PRINT_CHR
                    
                CMP NUM2,0AH
                JAE EKLE2
                ADD NUM2,30H
                JMP ATLA2
                
                EKLE2:
                    ADD NUM2,37H
                
                ATLA2:
                    MOV DL,NUM2
                    CALL PRINT_CHR            
                
                
                
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
        
          PRINT_CHR PROC
            
            PUSH AX
            MOV AH,02
            ;MOV DL,CHAR
            INT 21H   
            POP AX
            RET
            PRINT_CHR ENDP
        
        
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