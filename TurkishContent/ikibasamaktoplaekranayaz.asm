.model small
.stack 64
.data

sayi1 db 10
sayi2 db 99  
sonuc db ?
satir db 00
sutun db 01

.code

ana proc far
    mov ax,@data
    mov ds,ax
    
    mov ax,0000h
    
    mov ah,sayi1
    mov bh,sayi2
    add ah,bh
    
    mov sonuc,ah
    
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
    end ana