@Universidad del Valle de Guatemala
@Martha Gómez 19501
@Daniela Batz 19284
@Proyecto Final Assembler 
@Grupo 
@Temario 3 Juego Pi-DOTS

.text
 .align 2
 .global main
 .func main
@Main
main:
	ldr r10,=columna1

.data
.align 2
formato: asciz "%d\n"
bienvenida:     .asciz "Bienvenido a Pi-DOTS\n"
posicion: .asciz
columna1: .word 1 0,0,0,0,0
columna2: .word 2 0,0,0,0,0
columna3: .word 3 0,0,0,0,0
columna4: .word 4 0,0,0,0,0
columna5: .word 5 0,0,0,0,0
opcion: .word 0

salida:         .asciz "Gracias por jugar\n"
presentacion: . asciz " _____     _____              ______       ____ 
(  __ \   (_   _)            (_  __ \     / __ \   (___  ___)  / ____\ 
 ) )_) )    | |    ________    ) ) \ \   / /  \ \      ) )    ( (___   
(  ___/     | |   (________)  ( (   ) ) ( ()  () )    ( (      \___ \  
 ) )        | |                ) )  ) ) ( ()  () )     ) )         ) ) 
( (        _| |__             / /__/ /   \ \__/ /     ( (      ___/ /  
/__\      /_____(            (______/     \____/      /__\    /____/   
                                                                      "
