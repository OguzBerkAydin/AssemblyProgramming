.MODEL SMALL
 .STACK 64
 .DATA

 
 
 .CODE
 ANA PROC FAR 
 mov   ax,1ffah
 MOV CX,6
 
 TEKRAR: DEC CX
         DEC CX
         INC CX
         LOOP TEKRAR
         
 mov bh,-14        
 
MOV AH,4CH
 INT 21H
ANA ENDP 
 

 END ANA
    