/*
 * ToggleBit.asm
 *
 *  Created on: 30 de ago de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl ToggleBit

ToggleBit:
	#Máscara de bits
	subs r7, r7,r7
	adds r7, #1

	#Seta a máscara de bits para a posicao desejada
	lsls r7,r7, r1

	#Carrega o valor apontado por r0
	ldr r2, [r0]

	eors r2, r2, r7

	str r2, [r0]

ret


