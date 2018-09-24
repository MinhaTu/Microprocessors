/*
 * mymemset.asm
 *
 *  Created on: 8 de set de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mymemset

mymemset:
    adds r3, r0, #0
    push {r4}
	laco:
		strb r1, [r3]
		adds r3, #1
		//Condicao do laco
		subs r2, r2, #1
		subs r4,r2, #0
		bne laco
	pop {r4}
	ret




