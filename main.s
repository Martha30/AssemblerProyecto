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
@---------------Main---------------------------------
main:
	cont .req r5
	mov r5, #5
	ldr r0,=presentacion 	@mostrar titulo en asciiart
	bl puts
	
	ldr r0,=bienvenida 		@Bienvenida al usuario
	bl puts
	
	ldr r10,=columna1
	add r10, r10, #12

@-------------Tablero-------------------------
tablero:
	@--------A----------
	columnaA:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0,[r10]
		sub r10,r10,#4
		subs r5,r5,#1
		bne columnaA
	ldr r10,=columna2
	add r10, r10, #12
	mov r5, #5
	@------B-----------
	columnaB:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0,[r10]
		sub r10, r10, #4
		subs r5,r5, #1
		bne columnaB
	ldr r10,=columna3
	add r10, r10, #12
	mov r5, #5
	@-------C------------
	columnaC:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0,[r10]
		sub r10, r10, #4
		subs r5,r5, #1
		bne columnaC
	ldr r10,=columna4
	add r10, r10, #12
	mov r5, #5
	@-------D-------------
	columnaD:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0,[r10]
		sub r10, r10, #4
		subs r5,r5, #1
		bne columnaD
	ldr r10,=columna5
	add r10, r10, #12
	mov r5, #5
	@-------E--------------
	columnaE:
		bl aleatorios
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10,r10, #4
		subs r5,r5, #1
		bne columnaE
@------impresion de tablero-----------
printabl:
	ldr r4,=columna1
	add r4,r4, #12
	mov r5,#5 @a contador
	
	
@--------------datos-----------------------------	
.data
.align 2
formato: asciz "%d\n"
bienvenida:     .asciz "Bienvenido a Pi-DOTS\n"
posicion: .asciz
columna1: .word 1 A,B,C,D,E @fila 1
columna2: .word 2 0,0,0,0,0 @fila 2
columna3: .word 3 0,0,0,0,0 @fila 3
columna4: .word 4 0,0,0,0,0 @fila 4
columna5: .word 5 0,0,0,0,0 @fila 5
opcion: .word 0
cont: .word  

salida:         .asciz "Gracias por jugar\n"
presentacion : . asciz "  _____     _____              ______       ____      ______      ____  \n"
presentacion1: . asciz " (  __ \   (_   _)            (_  __ \     / __ \   (___  ___)  / ____\ \n"
presentacion2: . asciz "  ) )_) )    | |    ________    ) ) \ \   / /  \ \      ) )    ( (___   \n"
presentacion3: . asciz " (  ___/     | |   (________)  ( (   ) ) ( ()  () )    ( (      \___ \  \n"
presentacion4: . asciz "  ) )        | |                ) )  ) ) ( ()  () )     ) )         ) ) \n"
presentacion5: . asciz " ( (        _| |__             / /__/ /   \ \__/ /     ( (      ___/ /  \n"
presentacion6: . asciz " /__\      /_____(            (______/     \____/      /__\    /____/   \n"
                                                                      
																	  