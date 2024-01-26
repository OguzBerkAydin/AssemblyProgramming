.model small
.stack 64
.data

  satir db 00
  sutun db 00 
  
  mesaj1 db 'adinizi yaziniz: $'
  mesaj2 db 'karakteri girin: $'
  mesaj3 db '                             $'
  mesaj4 db 'bulunan karakter miktari: $'
  char db ?
  
  sayi1 db 0
  sayi2 db 0 
  sayac db 0  
  bulunan db 0   
  
  tek db 'tek$'
  cift db 'cift$'
  
.code

ana proc far
    mov ax,@data
    mov ds,ax
    
    
    call ekran_sil
    lea dx,mesaj1
    call yaz_str
    lea si,mesaj3
    basla:
    call klavye_giris
    cmp al,0dH
    je atla
    mov [si],al
    inc si
    inc sayac
    lea dl,al
    call yaz_chr
    jmp basla
    
    atla:
        inc satir
        call imlec
        lea dx,mesaj2
        call yaz_str
        
        
        
        call klavye_giris
        lea dl,al
        call yaz_chr
        
        lea si,mesaj3
        
        tekrar:
            cmp [si],al
            je bulundu
            inc si
            dec sayac
            cmp sayac,0
            je bitti
            jmp tekrar
            
        bulundu:
            inc bulunan
            inc si
            dec sayac
            cmp sayac,0
            je bitti
            jmp tekrar    
        
        
    bitti:            
        
        add bulunan,30h
        mov dl,bulunan        
        call yaz_chr     


    
    mov ah,4ch
    int 21h
    ana endp
       
       ekran_sil proc
        mov ax,0600h
        mov bh,17h
        mov cx,0
        mov dx,184fh
        int 10h
        ret
        ekran_sil endp 
       
       klavye_giris proc
           mov ah,00h
           int 16h
           ret
           klavye_giris endp
       
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
       
       imlec proc
        mov ah,02
        mov bh,00h
        mov dh,satir
        mov dl,sutun
        int 10h
        ret
        imlec endp
       
       
end ana