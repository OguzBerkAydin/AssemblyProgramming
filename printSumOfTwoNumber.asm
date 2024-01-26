.model small
.stack 64
.data

    num1 db 10
    num2 db 245
    result db ?
    row db 00
    column db 00
    
.code

    MAIN PROC FAR
        
        mov ax,@data
        mov ds,ax
        
        mov ax,0
        
        mov ah,num1
        mov bh,num2
        add ah,bh 
        mov result,ah
        
        
        start:
            
            mov al,result
            mov ah,00
            mov cl,100 
            div cl
            
            mov bl,al
            add bl,30h 
            call PRINT
            
            mov al,ah
            mov ah,0
            mov cl,10
            div cl
            mov bl,al
            add bl,30h
            call PRINT
            
            mov al,ah
            mov bl,al
            add bl,30h
            call PRINT
            
            
            mov ah,4ch
            int 21h
            
            
            
            
            
        
    
    MAIN ENDP 
    
    PRINT PROC
        
        push ax
        MOV AH,02
        MOV DL,BL
        INT 21H
        pop ax
        RET
        
    PRINT ENDP
    
    
    
    END MAIN
            