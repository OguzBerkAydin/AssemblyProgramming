.MODEL SMALL
.STACK 64
.DATA

    NUMBER DW 65000                   
    STR_NUM DB 'NUMBER: 8$'
    STR_BINARY DB 'BINARY VALUE: $'
    
    DIGIT DB ?
    
    ROW DB 00
    COLUMN DB 00
    
.CODE

    MAIN PROC FAR
        MOV AX,@DATA
        MOV DS,AX
        
        MOV ROW,0
        MOV COLUMN,0
        CALL CLEAR_SCREEN
        
        LEA DX,STR_NUM
        CALL PRINT_STR 
        
        

        INC ROW
        CALL CURSOR_POSITION
        
        LEA DX,STR_BINARY
        CALL PRINT_STR
        CALL FIND_BINARY_16BIT
        
        
        
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
    
     FIND_BINARY_16BIT PROC      
        
        MOV CX,16
        
        ITERATION:
            SHL NUMBER,1
            JNC ZERO
            MOV DL,'1' 
            CALL PRINT_CHR
            LOOP ITERATION
            JMP FINISHED
            
        ZERO:
            MOV DL,'0'
            CALL PRINT_CHR
            LOOP ITERATION
            
            FINISHED:    
            FIND_BINARY_16BIT ENDP
     
        
            
        
        
        
    CLEAR_SCREEN PROC
        MOV AX,0600
        MOV BH,07H
        MOV CX,0000H
        MOV DX,184FH
        INT 10H
        RET
        CLEAR_SCREEN ENDP
    
    CURSOR_POSITION PROC
        MOV AH,02
        MOV BH,00
        MOV DH,ROW
        MOV DL,COLUMN
        INT 10H
        RET
        CURSOR_POSITION ENDP
    
    
    PRINT_STR PROC
        MOV AH,09
        INT 21H
        RET
        PRINT_STR ENDP
    
    PRINT_CHR PROC
        MOV AH,02
        INT 21H
        RET
        PRINT_CHR ENDP
    
    
    
    END MAIN