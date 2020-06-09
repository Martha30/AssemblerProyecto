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
		bl printf
		mov r0, #0

	ldr r0, =presentacion1
		bl printf
		mov r0, #0
	ldr r0, =presentacion2
		bl printf
		mov r0, #0
	ldr r0, =presentacion3
		bl printf
		mov r0, #0
	ldr r0, =presentacion4
		bl printf
		mov r0, #0
	ldr r0, =presentacion5
		bl printf
		mov r0, #0
	ldr r0, =presentacion6
		bl printf
		mov r0, #0	
  
		ldr r0,=bienvenida 		@Bienvenida al usuario
		bl printf
	
		ldr r10,=columna1
		add r10, r10, #12

@-------------Tablero-------------------------
tablero:
	@--------A----------
	columnaA:
		bl myrand
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
		bl myrand
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
		bl myrand
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
		bl myrand
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
		bl myrand
		cmp r0, #100
		movgt r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10,r10, #4
		subs r5,r5, #1
		bne columnaE
@------impresion de tablero-----------
printabl:
	ldr r0,=puntaje
	mv r1,r11
	bl printf
	@-----------fila1-------------
	ldr r4,=columna1
	add r4,r4, #12
	mov r5,#5 @a contador
	cicloA:
		ldr r1[r4] 
		ldr r0,=formatd
		bl printf
		sub r4, r4, #4
		subs r5,r5,#1
		bne cicloA
	ldr r0,=formatn
	bl printf
	@-----------fila2-------------
	ldr r4,=columna2
	add r4,r4, #12
	mov r5,#5 @a contador
	cicloB:
		ldr r1[r4] 
		ldr r0,=formatd
		bl printf
		sub r4, r4, #4
		subs r5,r5,#1
		bne cicloB
	ldr r0,=formatn
	bl printf
	@-----------fila3-------------
	ldr r4,=columna3
	add r4,r4, #12
	mov r5,#5 @a contador
	cicloC:
		ldr r1[r4] 
		ldr r0,=formatd
		bl printf
		sub r4, r4, #4
		subs r5,r5,#1
		bne cicloC
	ldr r0,=formatn
	bl printf
	@-----------fila4-------------
	ldr r4,=columna4
	add r4,r4, #12
	mov r5,#5 @a contador
	cicloD:
		ldr r1[r4] 
		ldr r0,=formatd
		bl printf
		sub r4, r4, #4
		subs r5,r5,#1
		bne cicloD
	ldr r0,=formatn
	bl printf
	@-----------fila5-------------
	ldr r4,=columna5
	add r4,r4, #12
	mov r5,#5 @a contador
	cicloE:
		ldr r1[r4] 
		ldr r0,=formatd
		bl printf
		sub r4, r4, #4
		subs r5,r5,#1
		bne cicloE
	ldr r0,=formatn
	bl printf
	
	@------InicioJuego--------
	ldr r0,=movimiento @pregunta al usuario el movimiento que quiere hacer
	bl puts
	
	ldr r0,=op
	ldr r1,=opcion
	bl scanf
	ldr r1,=opcion
	ldr r1,[r1]
	
	cmp r1,#1
	beq op1
	cmp r1, #2
	beq op2

@-----opcion1-----------
op1:
	ldr r0,=fila
	bl puts
	
	ldr r0,=op
	ldr r1,=opcion
	bl scanf
	b printabl
@-----opcion2-----------
op2:
	ldr r0,=columna
	bl puts
	
	ldr r0,=op
	ldr r1,=opcion
	bl scanf
	b printabl

@-----Error----------
error:
	ldr r0,=msjError
	bl puts
	bl getchar
	b printabl

@-------salida---------------
exit:
	ldr r0,=salida
	bl puts 
	.unreq cont
	mov r7,#1
	swi 0
	
@--------------datos-----------------------------	
.data
.align 2
formato: asciz "%d\n"
bienvenida:     .asciz "Bienvenido a Pi-DOTS\n"
posicion: .asciz
puntaje: .asciz "El puntaje es %d\n"
columna1: .word 0,0,0,0,0 @fila 1
columna2: .word 0,0,0,0,0 @fila 2
columna3: .word 0,0,0,0,0 @fila 3
columna4: .word 0,0,0,0,0 @fila 4
columna5: .word 0,0,0,0,0 @fila 5
movimiento: .asciz "¿Posicion en que quiere mover? \n1.Fila \n2.Columna"
fila: .asciz "Fila en que se encuentra: "
columna: .asciz "Columna en donde se encuentra: "
opcion: .word 0 
formatd: .asciz "%d"
formatn: .asciz "\n"
op: .asciz "%d"
msjError: asciz "Dato no valido intente nuevamente"
Tpuntos: .word 20
salida:         .asciz " Gracias por jugar\n"


presentacion : . asciz "  _____     _____              ______       ____      ______      ____  \n"
presentacion1: . asciz " (  __ \   (_   _)            (_  __ \     / __ \   (___  ___)  / ____\ \n"
presentacion2: . asciz "  ) )_) )    | |    ________    ) ) \ \   / /  \ \      ) )    ( (___   \n"
presentacion3: . asciz " (  ___/     | |   (________)  ( (   ) ) ( ()  () )    ( (      \___ \  \n"
presentacion4: . asciz "  ) )        | |                ) )  ) ) ( ()  () )     ) )         ) ) \n"
presentacion5: . asciz " ( (        _| |__             / /__/ /   \ \__/ /     ( (      ___/ /  \n"
presentacion6: . asciz " /__\      /_____(            (______/     \____/      /__\    /____/   \n"
                                                                      
																	  
