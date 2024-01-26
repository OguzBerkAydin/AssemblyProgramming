.model small
.stack 64
.data
    
    num1 db ?
    num2 db ? 
    str db "1 e bastiniz$"

.code

    main proc far   
        
        mov ax,@data
        mov ds,ax
        
        mov ax,0
        
        call clearscreen
        call write
        cmp al,1

        lea dx,str
        call Print
        mov ah,4ch
        int 21h
        main endp  
    
    
    write proc    
                mov ah,00
                int 16h
                ret
                write endp
    
    Print proc    
        
        mov ah,09h
        int 21h
        ret
        Print endp
            
    ClearScreen proc
        mov ax,0600h
        mov bh,34h
        mov cx,0
        mov dx,184fh
        int 10h
        ret
        ClearScreen endp
    
    end main