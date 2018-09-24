/*
 * isLittleEndian.asm
 *
 *  Created on: 30 de ago de 2018
 *      Author: ailson
 */


.syntax unified
.text
.macro ret
	bx lr
.endm

.globl isLittleEndian

isLittleEndian:

	#Gerando uma palavra com mais de 16 bits
	subs r1,r1,r1
	adds r1, #1;
	lsls r1, r1, #18

	#Gardando valor anterior da memória
	ldr r2, [r0]

	#Escrevendo palavra >16bits
	str r1, [r0]

	#Lendo palavra de 16 bits
	ldrh r1, [r0]

	#Retomando o valor anterior a memoria
	str r2, [r0]

	subs r1, r1, #0
	beq little

	subs r0,r0,r0
	ret

	little: subs r0,r0,r0
			adds r0, #1
	ret




