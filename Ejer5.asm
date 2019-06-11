
mostrar_msj macro  char         ;Instrucciones para imprimir un mensaje en pantalla.
                 mov ah,09h
                 lea dx,char    ;Char parametro de entrada.
                 int 21h
endm 
mostrar_caracter macro char     ;Instrucciones para imprimir un caracter
    mov ah, 02h
    mov dl,char
    int 21h
endm


capturar_dato macro char        ;Instrucciones para capturar datos del teclado en tiempo de ejecucion.
    
                  mov ah,1   
                  int 21h
                  sub al,30h
                  mov char,al   ;Char: parametro en el que se va a guardar la direccion del dato. 
endm

              
            



.model small
.stack

.data

    resAnd  db ?     ;Variable para el resultado de la operacion AND
    resOr   db ?     ;Variable para el resultado de la operacion OR
    resXor  db ?     ;Variable para el resultado de la operacion XOR
    
    num1    db 0     ;Variable para datos de entrada.
    num2    db 0
    
    msgAnd  DB 10,13,'Resultado de AND: ','$'
    msgOr   DB 10,13,'Resultado de OR: ','$'
    msgXor  DB 10,13,'Resultado de XOR: ','$'
    msgNum1 DB 10,13, 'Numero 1: ','$'
    msgNum2 DB 10,13, 'Numero 2: ','$' 
    msj1 DB 10,13, 'Ingrese el primer digito: $'
    msj2 DB 10,13, 'Ingrese el segundo digito: $'   
    
    
.code
.startup

    ;Imprimir los numeros
        
      mov ax,@data
      mov ds,ax
      
       
      mostrar_msj msj1 
      capturar_dato num1 
      mostrar_msj msj2
      capturar_dato num2
      
     
    
    call oper_AND
    call oper_OR
    call oper_XOR
    .exit
         
  oper_AND:       
         
        mov bl, num1       ;Movemos los datos de cada variable a bl-cl.
        mov cl, num2
        
        and bl,cl          ;Realiza la operacion logica y guarda el resultado en bl.
        mov resAnd,bl      ;Mueve el resultado a la variable designada para imprimir el resultado.
        
        add resAnd,30h     ;Suma 30(Hexadecimal) al valor para pasarlo a formato decimal.
        
        mostrar_msj msgAND  ;Imprime el mensaje del resultado
        mostrar_caracter resAnd
        
         ret
     
         
   oper_OR: 
        
        mov bl, num1
        mov cl, num2
        
        or bl,cl
        mov resOr,bl
        
        add resOr,30h
        
        mostrar_msj msgOR
        mostrar_caracter resOr
        
        ret

    oper_XOR:
  
        mov bl, num1
        mov cl, num2
        
        xor bl,cl
        mov resXor,bl
        
        add resXor,30h
        
        mostrar_msj msgXOR
        mostrar_caracter resXor
       ret
    
   
end