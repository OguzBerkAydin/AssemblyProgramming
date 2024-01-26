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
  sayac2 db 0   
  
  tek db 'tek$'
  cift db 'cift$'
  
.code

ana proc far
    mov ax,@data
    mov ds,ax
     
    call ekran_sil
    call klavye_giris
    cmp al,35h
    ja buyuk
    lea dx,mesaj1
    call yaz_str
    jmp bitti2
    buyuk:
        lea dx,mesaj2
        call yaz_str
        jmp bitti2
    
    
     
    call ekran_sil
    call klavye_giris
    sub al,30h
    shr al,1
    jnc cift2
    lea dx,tek      
    call yaz_str
    jmp bitti2
    cift2:
        lea dx,cift
        call yaz_str
        jmp bitti2
    
    
    
    call ekran_sil
    lea dx,mesaj1
    call yaz_str
           
    lea si,mesaj3       
    tekrar:
    call klavye_giris
    cmp al,0dh
    je atla
    inc sayac
    mov [si],al
    inc si
    lea dl,al
    call yaz_chr 
    
    jmp tekrar
    
    
    
     atla:
    inc satir
    call imlec
    lea dx,mesaj2
    call yaz_str
    call klavye_giris
    mov char,al
    lea dl,al
    call yaz_chr
    
    inc satir
    call imlec
    lea dx,mesaj4
    call yaz_str
    
    lea si,mesaj3 
    
    basla:
        mov dl,char
        cmp [si],dl
        je buldu
        inc si
        dec sayac
        cmp sayac,0
        je bitti
        jmp basla
    
        buldu:
            inc sayac2
            inc si
            dec sayac 
            
            cmp sayac,0
            je bitti
            jmp basla
     
       bitti:
       mov al,sayac2
       add al,30h
       mov dl,al
       call yaz_chr 
       bitti2:
    
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