/**Universidad del valle de Guatemala*/
/*Organizacion y Estructura de Assembler*/
/*Proyecto 3 Pi-DOTS*/
/*Daniela Batz 19214: Martha Gomez 19501 */

.data
.align 2

@Matriz de entrada
columna0: .word   a b c d e
columna1: .word 1 0,0,0,0,0
columna2: .word 2 0,0,0,0,0
columna3: .word 3 0,0,0,0,0
columna4: .word 4 0,0,0,0,0
columna5: .word 5 0,0,0,0,0

@Mostrar columna
matriz. word 0 

@Defensiva
msjError