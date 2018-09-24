/*
 * strlen.asm
 *
 *  Created on: 9 de set de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mystrlen

mystrlen:

	subs r1,r1,r1 // seta o \0
	subs r2,r2,r2 // seta o contador
	laco:adds r2, #1
		ldrb r3, [r0]
		adds r0, #1
		subs r3, r3, r1 //vê se a string chegou ao fim
		beq fim
		b laco

	fim: subs r2,#1
		 subs r0,r0,r0
		 adds r0, r2, #0
		 ret




