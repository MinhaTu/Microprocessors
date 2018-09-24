/*
 * fibonacci.asm
 *
 *  Created on: 29 de ago de 2018
 *      Author: ailson
 */

.syntax unified
.text
.macro ret
	bx lr
.endm

.globl fibonacci

fibonacci:
#setagem dos registradores
  subs r1, r1, r1
  adds r2, r1, #1
  subs r3, r3, r3

  #Checa se r0 é nulo
  subs r7, r1,r0
  beq end1

  #Checa se r0 é um
  subs r7, r2, r0
  beq end1


  #Setagem do for
  subs r4,r4,r4
  #Checa se r0 == 2


  adds r4, #2
  laco: adds r4, #1

  		adds r3, r1,r2
  		adds r1, r2, #0
  		adds r2, r3, #0

  		subs r5, r0,r4
  		bne laco
  adds r0, r3, #0
  #Fim do algoritmo com laco
  ret

  #Fim do algoritmo sem laco
  end1: adds r0, r1, #0
  		ret
  end2: adds r0, r2, #0

ret




