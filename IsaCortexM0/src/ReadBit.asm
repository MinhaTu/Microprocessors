/*
 * ReadBit.asm
 *
 *  Created on: 30 de ago de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl ReadBit

ReadBit:

	#Máscara de bits
	subs r7, r7,r7
	adds r7, #1

	#Seta a máscara de bits para a posicao desejada
	lsls r7,r7, r1

	#carrega o valor apontador por r0
	ldr r2, [r0]

	ands r2, r2, r7
	adds r0, r2, #0
	bne um
    ret

	um: subs r0, r0, r0
		adds r0, #1
	ret





