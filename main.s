@ Universidad del Valle de Guatemala
@ Organizacion de computadoras y assembler
@Proyecto 3 - Juego PI-DOTS
@Martha Gómez 
@Daniela Batz

 .text
 .align 2
 .global main
 .func main
 
@----------------------Main----------------------------------------
main:

	cont .req r5
	mov r11, #0 
	ldr r0,=presentacion	@Mostrar titulo en asciiart
	bl printf
	mov r0,#0
	
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
	
	mov r6, #0
	ldr r0,=bienvenida		@Bienvenida al usuario
	bl puts
	
	
@-----------------Tablero------------------------------------	
tablero: 
	@-----------A-------------
	@Mostrar opciones
	ldr r0,=inicioj	
	bl puts
	mov r11, #0

	ldr r10,=columna1
	add r10, r10, #12
	mov r5, #5
	columnaA:
		bl aleatorios
		cmp r0, #100
		movge r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			
		subs r5,r5,#1
		bne columnaA

    @----------B-------------------

	ldr r10,=columna2
	add r10, r10, #12
	mov r5, #5

	columnaB:
		bl aleatorios
		cmp r0, #100 
		movge r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			
		subs r5,r5,#1
		bne columnaB

	@----------C-------------------

	ldr r10,=columna3
	add r10, r10, #12
	mov r5, #5

	columnaC:
		bl aleatorios
		cmp r0, #100
		movge r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			
		subs r5,r5,#1
		bne columnaC

	@-------------D----------------

	ldr r10,=columna4
	add r10, r10, #12
	mov r5, #5

	columnaD:
		bl aleatorios
		cmp r0, #100
		movge r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			
		subs r5,r5,#1
		bne columnaD

	@-----------E-------------------
	ldr r10,=columna5
	add r10, r10, #12
	mov r5, #5

	columnaE:
		bl aleatorios
		cmp r0, #100
		movge r0, #1
		movlt r0, #0
		str r0, [r10]
		sub r10, r10,#4 			
		subs r5,r5,#1
		bne columnaE

@-----------Impresion de Tablero---------------------

imprimirTablero: 
	ldr r0,=puntaje
	mov r1, r11
	bl printf
	
@-----------Fila1----------------------------------

	ldr r4,=columna1
	add r4, r4, #12 
	mov r5,#5 
	ciclo1:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formatod
		bl printf
		sub r4, r4, #4 
		subs r5,r5,#1
		bne ciclo1
	ldr r0,=formaton
	bl printf

@----------Fila2-----------------------------------
	ldr r4,=columna2
	add r4, r4, #12 
	mov r5,#5 
	cicl2:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formatod
		bl printf
		sub r4, r4, #4 
		subs r5,r5,#1
		bne cicl2
	ldr r0,=formaton
	bl printf

@----------Fila3----------------------------------

	ldr r4,=columna3
	add r4, r4, #12 
	mov r5,#5 
	cicl3:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formatod
		bl printf
		sub r4, r4, #4 
		subs r5,r5,#1
		bne cicl3

	ldr r0,=formaton
	bl printf
	
@---------------Fila4--------------------------
	ldr r4,=columna4
	add r4, r4, #12 
	mov r5,#5 
	ciclo4:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formatod
		bl printf
		sub r4, r4, #4 
		subs r5,r5,#1
		bne ciclo4
	ldr r0,=formaton
	bl printf
	
@------------Fila5----------------------------------

	ldr r4,=columna5
	add r4, r4, #12 
	mov r5,#5 
	ciclo5:
		ldr r1,[r4]    @valor de datos para imprimir
		ldr r0,=formatod
		bl printf
		sub r4, r4, #4 
		subs r5,r5,#1
		bne ciclo5

	ldr r0,=formaton
	bl printf



@-----------------Inicio del Juego----------------------------

	ldr r0,=movimiento		
	bl puts

	ldr r0,=dato
	ldr r1,=opcion
	bl scanf
	ldr r1,=opcion
	ldr r1,[r1]


	cmp r1, #1
	beq opcion1
	cmp r1, #2
	beq opcion2
	cmp r1, #3
	beq tablero
	cmp r1, #4
	beq exit
	cmp r1, #5
	bge clase
	bne incorrecto

@---------------Opciones--------------------
opcion1: 

	ldr r0,=fila
	bl puts

	ldr r0,=dato
	ldr r1,=local
	bl scanf
	ldr r0,=colu1		
	bl puts
	ldr r0,=dato
	ldr r1,=iniciar
	bl scanf

	ldr r0,= colu2
	bl puts
	ldr r0,=dato
	ldr r1,=fin
	bl scanf

	b ordenfila

@------------------Opciones------------------------- 
opcion2: 

	ldr r0,=columna
	bl puts
	ldr r0,=dato
	ldr r1,=local
	bl scanf

	ldr r0,=fil1		
	bl puts
	ldr r0,=dato
	ldr r1,=iniciar
	bl scanf

	ldr r0,= fil2
	bl puts
	ldr r0,=dato
	ldr r1,=fin
	bl scanf

	b ordencolumna
	
ordenfila:
	
	ldr r1,=local
	ldr r1,[r1]

	cmp r1, #1 
	beq f1
	cmp r1, #2
	beq f2
	cmp r1, #3
	beq f3
	cmp r1, #4
	beq f4
	cmp r1, #5
	beq f5
	bge clase
	bne incorrecto

	@--------------------Programación defensiva------------------------------
	f1:

		ldr r4,=columna1
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		consulta:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep1:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq defen
				cmp r7, r8
				bne defen
				add r1, r1, #1
				cmp r1, r0
				bne rep1

		ldr r4,=columna1
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]

		@----------------Contador-------------------
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		ciclo:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne ciclo

		b imprimirTablero


	f2:
		ldr r4,=columna2
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		consulta2:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			ciclo2:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq defen
				cmp r7, r8
				bne defen
				add r1, r1, #1
				cmp r1, r0
				bne ciclo2

		ldr r4,=columna2
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]

@------Contador-----------------
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		segciclo:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne segciclo

		b imprimirTablero

	f3:
		ldr r4,=columna3
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		consulta3:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			ciclo3:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq defen
				cmp r7, r8
				bne defen
				add r1, r1, #1
				cmp r1, r0
				bne ciclo3

		ldr r4,=columna3
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]

		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		consul4:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne consul4

		b imprimirTablero

	f4:
		ldr r4,=columna4
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		consulta4:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq error
			rep4:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq defen
				cmp r7, r8
				bne defen
				add r1, r1, #1
				cmp r1, r0
				bne rep4

		ldr r4,=columna4
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		c4:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne c4

		b imprimirTablero

	f5:
		ldr r4,=columna5
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0,[r0]
		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9

		consulta5:
			ldr r7, [r4]
			add r1, r1, #1
			cmp r7, #0
			beq defen
			rep5:
				sub r4, r4, #4
				ldr r8,[r4]
				cmp r8, #0
				beq error
				cmp r7, r8
				bne defen
				add r1, r1, #1
				cmp r1, r0
				bne rep5

		ldr r4,=columna5
		add r4, r4, #12
		ldr r1,=iniciar
		ldr r1,[r1]
		@Sumar a contador
		mov r6, #0
		sub r6, r0, r1
		add r6, #1
		add r11, r11, r6
		sub r1, r1, #1
		ldr r0,=fin
		ldr r0, [r0]

		mov r6, #4
		mul r9, r6, r1
		sub r4, r4, r9
		mov r12, #0
		str r12, [r4]
		add r1, r1, #1
		mov r9, #4

		c5:
			sub r4, r4, r9
			str r12, [r4]
			add r1, r1, #1
			cmp r1, r0
			bne c5

		b imprimirTablero

ordencolumna:
	consul:
		mov r9, #0
		ldr r0,=iniciar
		ldr r0, [r0]
		ldr r1,=fin
		ldr r1, [r1]
		add r1, r1, #1
		ldr r8,=local
		ldr r8, [r8]
		sub r8, r8, #1
		cmp r0, #1
		beq colum1
		cmp r0, #2
		beq colum2
		cmp r0, #3
		beq colum3
		cmp r0, #4
		beq colum4
		cmp r0, #5
		beq colum5
		bge clase
		bne incorrecto
		colum1:
			ldr r4,=columna1
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b acertado
		colum2:
			ldr r4,=columna2
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b acertado
		colum3:
			ldr r4,=columna3
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b acertado
		colum4:
			ldr r4,=columna4
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b acertado
		colum5:
			ldr r4,=columna5
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r9, [r4]
			b acertado
	@---------------Revisa la cadena---------------------------
	acertado:
		ldr r8,=local
		ldr r8, [r8]
		sub r8, r8, #1
		cmp r0, r1
		beq espacios
		cmp r0, #1
		beq a1
		cmp r0, #2
		beq a2
		cmp r0, #3
		beq a3
		cmp r0, #4
		beq a4
		cmp r0, #5
		beq a5

		a1:
			ldr r4,=columna1
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne defen
			cmp r9, r10
			beq acertado
		a2:
			ldr r4,=columna2
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne defen
			cmp r9, r10
			beq acertado
		a3:
			ldr r4,=columna3
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne defen
			cmp r9, r10
			beq acertado
		a4:
			ldr r4,=columna4
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne defen
			cmp r9, r10
			beq acertado
		a5:
			ldr r4,=columna5
			add r4, r4, #12
			mov r6, #4
			mul r6, r6, r8
			sub r4, r4, r6
			ldr r10, [r4]
			add r0, r0, #1
			cmp r9, r10
			bne defen
			cmp r9, r10
			beq acertado

	@-----------Llena los espacios vacios------------------------
	espacios:
		ldr r0,=iniciar
		ldr r0, [r0]
		ldr r1,=fin
		ldr r1, [r1]
		add r1, r1, #1
		@Sumar a contador
		mov r6, #0
		sub r6, r1, r0
		add r11, r11, r6
		ldr r8,=local
		ldr r8, [r8]
		sub r8, r8, #1

		iniciociclo:
			cmp r0, r1
			beq imprimirTablero
			cmp r0, #1
			beq col1
			cmp r0, #2
			beq col2
			cmp r0, #3
			beq col3
			cmp r0, #4
			beq col4
			cmp r0, #5
			beq col5

			col1:
				ldr r4,=columna1
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b iniciociclo

			col2:
				ldr r4,=columna2
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b iniciociclo

			col3:
				ldr r4,=columna3
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b iniciociclo

			col4:
				ldr r4,=columna4
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b iniciociclo

			col5:
				ldr r4,=columna5
				add r4, r4, #12
				mov r6, #4
				mul r6, r6, r8
				sub r4, r4, r6
				mov r12, #0
				str r12, [r4]
				add r0, r0, #1
				b iniciociclo

@-----------Mensajes de error-------------------------
defen:
	ldr r0,=error
	bl puts

	sub r11, r11, #3
	b imprimirTablero
clase:
	ldr r0,=opno
	bl puts
	b imprimirTablero
incorrecto: 
	ldr r0,=merror
	bl puts
	bl getchar
	b imprimirTablero

	.unreq	cont
	mov r7,#1
	swi 0

.data
.align 2



@@Variables:
bienvenida:  .asciz "\nBienvenido al juego Pi-DOTS!"
movimiento: .asciz "Seleccione el movimiento a realizar \n 1. Fila \n 2. Columna \n 3. Nueva Ronda \n 4. Salir"
puntaje: .asciz "punteo: %d\n"
total: .asciz "Total de puntos: %d\n"
error1:	.asciz "El movimiento no es válido, se restan 3 puntos"
dato:   .asciz " %d"
fila: .asciz "En que fila se encuentra"
fil1: .asciz "En que fila inicia "
fil2: .asciz "En que fila termina "
colu1: .asciz "En que columna inicia"
colu2: .asciz "En que columna termina "
merror:   .asciz	"Error. Intente nuevamente.\n"
inicioj: .asciz "INICIO"
opno: .asciz "   Opcion no válida "
formatod: .asciz "  %d"
formaton: .asciz "\n"
columna: .asciz "En que columna se encuentra" 
iniciar: 	.word 0
fin:	.word 0
opcion:	.word 0
local:	.word 0
columna1: .word 0, 0, 0, 0, 0
columna2: .word 0, 0, 0, 0, 0
columna3: .word 0, 0, 0, 0, 0
columna4: .word 0, 0, 0, 0, 0
columna5: .word 0, 0, 0, 0, 0

presentacion : .asciz "  _____     _____              ______       ____      ______      ____  \n"
presentacion1: .asciz " (  __ \   (_   _)            (_  __ \     / __ \   (___  ___)  / ____\ \n"
presentacion2: .asciz "  ) )_) )    | |    ________    ) ) \ \   / /  \ \      ) )    ( (___   \n"
presentacion3: .asciz " (  ___/     | |   (________)  ( (   ) ) ( ()  () )    ( (      \___ \  \n"
presentacion4: .asciz "  ) )        | |                ) )  ) ) ( ()  () )     ) )         ) ) \n"
presentacion5: .asciz " ( (        _| |__             / /__/ /   \ \__/ /     ( (      ___/ /  \n"
presentacion6: .asciz " /__\      /_____(            (______/     \____/      /__\    /____/   \n"
                                                                      
																	  
