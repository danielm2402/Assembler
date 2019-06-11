.model small
.stack
.data 
      
       Idx db 26      ;Indice que se imprime desde 26-1
       ascii db 122   ;Ubicacion de la z minuscula en el codigo ascii
 .code
  main:
    mov ax,@data
  mov ds,ax  
  mov cx,26            ;Indice contador para el ciclo
  ;lea dx,varMensaje
  call imprimirAbc
   .exit
   imprimirAbc:
             ciclo:
             mov al, idx
        AAM
        mov bx, ax       ;almacena el valor de idx
        mov ah, 02h       ;salida de caracteres
        mov dl, bh        ; almacena en dl la primer parte del dijito de idx(decenas, en hexadesimalde 16bits)
        add dl, 30h       ; sumamos 30 (hexadescimal) para pasar al codigo numerico ascii
        int 21h
        
        mov ah,02h        
        mov dl, bl         ;mueve a dl la el segundo dejito de idx (unidades,en hexadecimalde 16bits)
        add dl, 30h
        int 21h
        
        mov dl, 17h  ;Agrega una flecha despues del indice
        int 21h
        
        mov ah, 02h          ;imprime las lectras desde z-a
        mov dl, ascii
        int 21h
        
        mov dl, 0ah       ;salto de linea
        int 21h
        
        sub idx, 1       ;resta uno al indice
        sub ascii,1      ;resta el valor del ascii en 1
    loop ciclo
     
    ret
    end main