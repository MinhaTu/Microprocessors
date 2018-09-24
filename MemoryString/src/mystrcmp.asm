/*
 * mystrcmp.asm
 *
 *  Created on: 9 de set de 2018
 *      Author: ailson
 */
.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mystrcmp

mystrcmp:
	push {r4}
	laco: ldrb r2, [r0]
		  ldrb r3, [r1]

		  subs r4, r2, r3
		  bne fimNequal

		  adds r0, #1
		  adds r1, #1

		  //COndicao do laco
		  subs r4, r2, #0 //se chegou no \0
		  bne laco

		  subs r0,r0,r0 // Todos os bytes iguais
		  pop {r4}
		  ret


	fimNequal: subs r4, r2, r3		// Testa se r3 é maior que r2
			   bmi fimR3greaterthanR2 //Frag de negativo ativado

			   subs r0,r0,r0
			   adds r0, #1
			   pop {r4}
			   ret


	fimR3greaterthanR2: subs r0,r0,r0
						adds r0, #-1
						pop {r4}
						ret
