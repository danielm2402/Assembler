 mostrar macro
        
    pop ax     ;desapilamos los datos
    sub ax,48    ;pasamos el numero a valor hexadecimal
    mov bx,1h 
    mul bx          ;multiplicamos para optener las unidades
    mov num,ax
    pop ax
    sub ax,48
    mov bx,10h
    mul bx        ;multiplicamos para optener las decenas
    add ax,num
    mov num,ax
    pop ax
    sub ax,48
    mov bx,100h    ;multimplicamos para optener las centenas
    mul bx
    add ax,num
    mov num,ax
    pop ax
    sub ax,48
    mov bx,1000h   ;multiplicamos para optener las unidades de mil
    mul bx
    add ax,num
                    
 endm 
 
 leer_cad macro
    mov ax,0  
  
    mov ah,01h   ;se piden los datos y se van almanand en la pila
    int 21h ;  
  
    mov ah,0 
    push ax        ;ingresar a la pila
    inc si
    cmp al,0dh
  
    ja llamar_leer
    jb llamar_leer
  
    dec si 
    pop bx
  
 endm 
.model small
.stack 200
.data
num dw 0 
aux dw 0        

.code 
.startup        
        mov ax,@data  
        mov ds,ax                  
        llamar_leer: 
        leer_cad       ; llamado a los macro por medio de saltos 
        llamar_mostrar: 
        mostrar
        .exit       
        
end 
 