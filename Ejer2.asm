;Realice un programa que invierta una cadena ingresada por consola (1.0).



 imprimir macro
        
    pop bx ; Desapila
    mov varcadena,bl ; movemos a una variable
 
    lea dx,varcadena
    mov ah,09
    int 21h
 
    cmp si,0 ;se hace la comparacion si con 0
    dec si; se decrementa el registro SI 
    jnz llamarmostrar  ; se verifica cuando la pila no tenga letras
 endm 
 
 leercadena macro
    mov ax,0 ;limpiamos el registro ax 
  
    mov ah,01h
    int 21h 
  
    mov ah,0 ; ponemos 0 en ah para no afectar ax
    push ax ; ingresamos en la pila
    inc si ; se incrementa (si) para que se vuelva el numero elementos que hay en la pila
    cmp al,013; comparamos con la tecla ENTER
  
    ja llamarleer   
    jb llamarleer
  
    dec si  ; decrementamos (si) porque cuando se haya presionado enter, el codigo ascii de 
    pop bx ; enter se toma como otro valor para la pila entonces debemos sacarlo de la pila
  
    lea dx,mensaje3 
    mov ah,09
    int 21h
    jmp llamarmostrar
 endm   
 
 
 
.model small
.stack 200
.data  
mensaje2 db 10,13,7,'Cadena:$'  
mensaje3 db 10,13,7,'Cadena invertida:$'  
varcadena db  ?,'$'     

.code 
.startup        
        mov ax,@data
        mov ds,ax     
            
        lea dx,mensaje2       
        mov ah,09      
        int 21h       
        
        llamarleer:   
        leercadena         
        llamarmostrar:    
        imprimir        
        .exit
end 
 



