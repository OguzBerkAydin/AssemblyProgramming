.model small
.stack 64
.data

    str1 db 'Hello',0ah,0dh,'$'
    str2 db 'World$'
.code


    main proc far
        
        mov ax,@data
        mov ds,ax
               
        call cleanScreen
        lea dx,str1
        call print
        lea dx,str2
        call print       
               
               
               
        mov ah,4ch
        int 21
        main endp
    
            
            print proc
               mov ah,09h
               int 21h
               ret
               print endp
            
            cleanScreen proc
                mov ax,0600h
                mov bh,30h
                mov cx,0000h
                mov dx,184fh
                int 10h 
                ret
                cleanScreen endp              
        end main