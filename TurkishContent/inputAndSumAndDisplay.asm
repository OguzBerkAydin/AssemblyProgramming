.model small
.stack 64
.data 

satir db 00
sutun db 00
sayi1 db ?
sayi2 db ?
sonuc db 'Sonuc: $' 

str1 db 'sayi1: $'
str2 db 'sayi2: $' 

sonucmsb db 0
sonuclsb db 0

.code

    ana proc far
    mov ax,@data
    mov ds,ax
    
    mov ax,0000h
    
    call ekrsil
    call kurkon 
    lea dx,str1
    call yaz
    call write
             
             
    mov bl,al
    mov bh,al

    call ekranayaz 
        and bl,0fh
    inc satir
    call kurkon 
    lea dx,str2
    call yaz
    call write
    mov ch,al 
    mov bl,al
    call ekranayaz
    and ch,0fh
    add ch,bh 
    mov sonuc,ch
    inc satir
    call kurkon 
    lea dx,sonuc
    call yaz     
    
    mov al,sonuc
    mov cl,10
    div cl
    
    mov bl,ah 
    call ekranayaz
    inc satir
    call kurkon
    
    mov bl,al
    call ekranayaz 
    
    
   

    
    

            
        mov ah,4CH
        int 21h
        ana endp 
        
        write proc    
                mov ah,00
                int 16h
                ret
                write endp

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
     push bx   
     MOV AH,02
     MOV BH,00
     MOV DH,satir
     MOV DL,sutun
     INT 10H 
     pop bx
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