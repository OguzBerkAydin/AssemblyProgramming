.model small
.stack 64
.data
      satir db 00
      sutun db 00
      
      mesaj db 'adiniz: $'
      adiniz db '                      $'
      
      mesaj2 db 'numaraniz: $'
      numara db '                       $'
     
.code

    proc main far
        
        mov ax,@data
        mov ds,ax                
        
        call ekran_sil 
        lea dx,mesaj
        call yaz_str 
        
        lea si,adiniz
                             
        
        tekrar:
            
            call klavyeden_giris 
            cmp al,0dh
            je bitti
            mov dl,al 
            mov [si],al 
            inc si
            call yaz_chr 
            jmp tekrar
        bitti:
            inc satir
            call imlec_konumla
            lea dx,mesaj2
            call yaz_str 
        
        lea si,numara
            
        tekrar2:
            
            call klavyeden_giris 
            cmp al,0dh
            je bitti2  
            mov [si],al
            inc si
            mov dl,al
            call yaz_chr 
            jmp tekrar2  
            
        bitti2:
            mov satir,12
            mov sutun,5
            call imlec_konumla
            lea dx,numara
            call yaz_str
            
            inc satir
            call imlec_konumla
            lea dx,adiniz
            call yaz_str    
                
            
            
        
        mov ah,4ch
        int 21h
        
        main endp
    
    ekran_sil proc
        mov ax,0600h
        mov bx,3400h
        mov cx,0000h
        mov dx,184fh
        int 10h
        ret
        ekran_sil endp 
    
    imlec_konumla proc
        mov ah,02
        mov bh,00
        mov dh,satir
        mov dl,sutun
        int 10h
        ret
        imlec_konumla endp
    
    yaz_str proc     
        push ax
        mov ah,09
        int 21h
        pop ax
        ret
        yaz_str endp
    
    yaz_chr proc
        push ax
        mov ah,02
        int 21h
        pop ax
        ret
        yaz_chr endp
        
    klavyeden_giris proc
        mov ah,00
        int 16h    
        ret
        klavyeden_giris endp
    
    end main
    