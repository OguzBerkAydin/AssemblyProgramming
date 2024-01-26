.model small
.stack 64
.data
.code
    ana proc far
    mov cx,16
    mov al,10h
    mov bl,25h
    
    tekrar:
        ror al,1 
        rcl bl,1
        loop tekrar
    
    mov ah,4ch
    int 21
    
    ana endp
    end ana