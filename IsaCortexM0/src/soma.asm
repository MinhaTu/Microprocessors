.syntax unified
.text
.macro ret
	bx lr
.endm

.globl soma

soma:


	#Setagem do registrador de contador
	subs r6,r6,r6
	#Setagem do registrador de incremento do vetor
	subs r7,r7,r7

	subs r3,r3,r3

	laco: adds r6, #1
		  ldr r4, [r0, r7]
		  ldr r5, [r1, r7]
		  adds r3, r4, r5
		  str r3, [r0, r7]
		  adds r7, #4
		  subs r5, r2, r6
		  bne laco


ret
