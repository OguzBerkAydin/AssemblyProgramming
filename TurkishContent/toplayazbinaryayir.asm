.model small
.stack 64
.data

sayi1 db 99
sayi2 db 99  
sonuc db ?
satir db 00
sutun db 01 
sayi1Mesaj db 'sayi1:99$'
sayi2Mesaj db 'sayi2:99$'
sonucMesaj db 'sonuc:$'

sayi3 dw 223
bd db 'Binary Deger: $'

.code

ana proc far
    mov ax,@data
    mov ds,ax
    
    mov ax,0000h
    
    mov ah,sayi1
    mov bh,sayi2
    add ah,bh
    
    mov sonuc,ah 
     call ekrsil
    lea dx,sayi1Mesaj  
    
    call yaz  
    inc satir
    call kurkon
    lea dx,sayi2Mesaj
    call yaz
    
    inc satir
    call kurkon 
    lea dx,sonucMesaj
    call yaz
    
    basla:
        mov al,sonuc
        mov ah,00
        mov cl,100
                                        
        div cl
        mov bl,al
        add bl,30h 
        call ekranayaz
        
        mov al,ah
        mov ah,00
        mov cl,10
        div cl
        mov bl,al
        add bl,30h
        call ekranayaz 
        
        mov al,ah
        mov bl,al
        add bl,30h
        call ekranayaz
        
        inc satir
        call kurkon
        lea dx,bd 
        call yaz    
        mov cx,16
        tekrar:
            
            shl sayi3,1
            jnc sifir 
            mov bl,01
            add bl,30h
            
            call ekranayaz
            loop tekrar
            jmp bitti
                
            
        sifir:
             mov bl,00 
             add bl,30h
             call ekranayaz
             loop tekrar   
        
        bitti:
            
        mov ah,4CH
        int 21h
        ana endp

    EKRANAYAZ PROC
    PUSH AX
    MOV AH,02
    MOV DL,BL
    INT 21H
    POP AX
    RET
    EKRANAYAZ ENDP
    
    EKRSIL PROC
     MOV AX,0600H
     MOV BH,20;30H
     MOV CX,0000H
     MOV DX,00;284FH
     INT 10H
     RET
     EKRSIL ENDP 
     
     KURKON PROC
     MOV AH,02
     MOV BH,00
     MOV DH,satir
     MOV DL,sutun
     INT 10H
     RET
    KURKON ENDP
     YAZ PROC
        push ax
 MOV AH,09
 INT 21H  
 pop ax
 RET
 YAZ ENDP
    end ana