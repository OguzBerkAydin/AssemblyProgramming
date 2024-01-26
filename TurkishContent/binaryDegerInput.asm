.model small
.stack 64
.data
  
  sayi1 dw ? 
  satir db 00
  sutun db 00 
  bd db 'Binary Deger: $'
  sayi1Mesaj db 'girilen sayi Binary Degeri: $'

.code
    
    ana proc far 
        mov ax,@data
        mov ds,ax
        
        mov ax,0 
        
        call clearscreen 
        call kurkon
        lea dx,sayi1Mesaj
        call print
        call write
        mov sayi1,ax
        
        mov cx,16
        tekrar:
            
             shl sayi1,1
             jnc sifir
             mov bl,01
             add bl,30h
             call basamakYaz
             loop tekrar
             jmp bitti
             
        sifir:
            
            mov bl,00
            add bl,30h
            call basamakYaz
            loop tekrar     
        
        bitti:
        
        mov ah,4ch
        int 21h
        
        ana endp
        
        ClearScreen proc
        mov ax,0600h
        mov bh,34h
        mov cx,0
        mov dx,184fh
        int 10h
        ret
        ClearScreen endp
        
        Print proc    
        push ax
        mov ah,09h
        int 21h  
        pop ax
        ret
        Print endp 
        
        basamakYaz proc    
            push ax
            mov ah,02
            mov dl,bl
            int 21h
            pop ax
            ret
            
            
            basamakYaz endp
                     
        write proc    
                mov ah,00
                int 16h
                ret
                write endp
        KURKON PROC
     MOV AH,02
     MOV BH,00
     MOV DH,satir
     MOV DL,sutun
     INT 10H
     RET
    KURKON ENDP
                     
    end ana