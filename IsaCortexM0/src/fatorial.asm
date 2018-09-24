/*
 * fatorial.asm
 *
 *  Created on: 29 de ago de 2018
 *      Author: ailson
 */




.syntax unified
.text
.macro ret
	bx lr
.endm

.globl fatorial

fatorial:
	#Registrador temporário
	adds r1,r0, #0
	adds r2, r0, #0

	#Inicializa contador com 1
	subs r3,r3,r3
	adds r3, #1
	laco: adds r3, #1
		subs r1, #1
		muls r0, r0, r1

		subs r7, r2,r3
		bne laco



ret
