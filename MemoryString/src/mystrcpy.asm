/*
 * mystrcpy.asm
 *
 *  Created on: 9 de set de 2018
 *      Author: ailson
 */


.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mystrcpy

mystrcpy:
	push {r0}
	laco: ldrb r2, [r1] //lê byte apontado por r1
		  strb r2, [r0] // escreve byte na posição apontada por r0

		  adds r0, #1 //incrementa a memória
		  adds r1, #1

		  //Condicao do laco
		  subs r3, r2, #0
		  bne laco

	pop {r0}
	ret




