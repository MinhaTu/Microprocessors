/*
 * mymemcmp.asm
 *
 *  Created on: 8 de set de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mymemcmp

mymemcmp:
	subs r3, r2, #0
	beq  ret

	push {r4-r5}
	laco: ldrb r3, [r0] //carrega os bytes apontados por r0 e r1
		  ldrb r4, [r1]

		  subs r5, r3, r4 // testa se os bytes são iguais
		  bne fimNEqual


		  adds r0, #1
		  adds r1, #1

		  //condição laco
		  subs r2, #1
		  subs r3, r2,#0
		  bne laco

		  subs r0,r0,r0 // todos os bytes iguais
		  pop {r4-r5}
		  ret

	fimNEqual: subs r3, r3, r4 //Testa se r4 é maior que r3
			   bmi fimR4greaterThanR3

			   subs r0,r0,r0	// r3 é mair que r4
			   adds r0,#1
			   pop {r4-r5}
			   ret
	fimR4greaterThanR3: subs r0,r0, r0
						subs r0,#1
						pop {r4-r5}
						ret






