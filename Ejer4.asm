; Realice un programa que le pregunta al usuario si desea continuar. Si el usuario pulsa ‘S’ o ‘s’ el
;programa continua su ejecución. Si el usuario pulsa la tecla 'N' o 'n' el programa finaliza y si el
;usuario pulsa otra tecla el programa despliega un mensaje de error (1.0).
.MODEL SMALL
.STACK
.DATA
    dato db ? ;variable de entrada 
    
    Msj2 DB 10,13,'Error $'; mensaje de error
    Msj DB 10,13,'Desea continuar?: $' ; mensaje de continuación
.CODE
MAIN:   
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9          ;Muestra primer mensaje
    LEA DX, Msj
    INT 21H
    
    MOV AH, 01           ; lee dato
    INT 21H
    MOV dato, AL
           
     CMP AL, 115          ; compara dato con s
     JE continuar         ; si dato es igual a s salta a continuar
     CMP AL, 083           ;compara dato con S
     JE continuar         ;si dato es igual a S salta a continuar
     CMP AL, 110          ;compara dato con n
     JE salir             ;si dato es igual a n salta a salir
     CMP AL, 078          ;compara dato con N
     JE salir             ;si dato es igual a N salta a salir
     JMP error            ; si al llegar hasta esta parte del código, no se saltó a ninguna etiqueta anterio,
                          ;significa que no se presionó: S,s,N,n, o sea, se presionó una tecla equivocada, por lo tanto salta a error


continuar: 
    jmp MAIN    ; salta al Main
error:
    MOV AH, 9           ;muestra mensaje de error y salta al main
    LEA DX, Msj2
    INT 21H 
    JMP MAIN
salir:

  .exit             ;finaliza, se encapsula para ser llamado y finalizar la aplicación
   end