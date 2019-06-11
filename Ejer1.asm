
capturarCaracteres macro (varWord)
mov si,0
         leer:
        mov ah,01h
        int 21h
        mov varWord[si],al
        inc si
        cmp al,0dh

        ja leer
        jb leer
 endm


.model small 
.data 
msj1 db 10,13," Ingrese Cadena de caracteres: $ "
msj2 db 10,13," Cadena en mayusculas:  $"  
msj3 db 10,13," Cadena en minusculas:  $"
varWord db 11 dup('$'), 


.code 

Principal:

mov ax,@data 
mov ds,ax  


lea dx,msj1
mov ah,09h
int 21h

capturarCaracteres (varWord)
        

 

lea dx,msj2
mov ah,09h
int 21h

call pasarMayus

continuarMinusculas:

lea dx,msj3
mov ah,09h
int 21h 

call pasarMinus
 salir:
    .exit 
       
            pasarMayus proc 
                mov si,0 
                SgtLetraMin: 
                    
                    mov al,varWord[si]   
                    cmp al,'$'          
                    
                    jz finPalabra       
                           
                    cmp al,7ah           ;Compara com la z 
                    jg NoEsMinuscula     ;Etiqueta tipo condicional. verifica que es menor que z
            
                    cmp al,61h         ;compara con la a
                    jl NoEsMinuscula ;Verifica si es mayor que a,

                    sub al,20H  ;Convierte a mayuscula el caracter almacenado en al 
            
                    NoEsMinuscula:
                    
                    mov dl,al ; Se imprime el caracter 
                    mov ah,02h 
                    int 21h 
                    
                    inc si 
                    jmp SgtLetraMin 
                    
                    finPalabra:	jmp continuarMinusculas
                pasarMayus endp
            
            
             pasarMinus proc 
                    mov si,0 
                    SgtLetraMay: 
                            mov al,varWord[si]    ;accede indice a indice en la cadena
                            cmp al,'$' 
                            jz finPalabra2 
                            
                            cmp al,5Ah   ;Compara con la Z
                            jg noEsMayuscula 
                            
                            cmp al,41h      ;compara con la A
                            jl noEsMayuscula 
                            
                            add al,20H 
                            NoEsMayuscula:
                                mov dl,al 
                                mov ah,2 
                                int 21h 
                            
                                inc si 
                                jmp SgtLetraMay 
                    
                            finPalabra2:	
                                jmp salir
             pasarMinus endp 
            end 




