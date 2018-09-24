/*
 * SetBit.asm
 *
 *  Created on: 30 de ago de 2018
 *      Author: ailson
 */


/**
@brief Seta o bit da posição de memória apontada por p
@param p Ponteiro para variável de 32bits cujo bit será setado
@param bitn Posição do bit (0 a 31) a ser setado
*/

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl SetBit

SetBit:
	#Máscara de bits
	subs r7, r7,r7
	adds r7, #1

	#Seta a máscara de bits para a posicao desejada
	lsls r7,r7, r1

	#Carrega o valor apontado por r0
	ldr r2, [r0]
	orrs r2, r2, r7
	str r2, [r0]
ret

