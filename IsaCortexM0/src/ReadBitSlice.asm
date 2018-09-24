
.syntax unified
.text
.macro ret
	bx lr
.endm

.globl ReadBitSlice

ReadBitSlice:

	#Máscara de bits
	subs r7,r7,r7

	#Contador
	adds r6, r1, #0

	adds r2, #1
	laco: subs r4,r4,r4
		  adds r4, #1
		  lsls r4, r4, r6

		  orrs r7, r7, r4
		  adds r6,#1
		  subs r5, r2, r6
		  bne laco


	#Carregar valor apontador por r0
	ldr r4, [r0]

	ands r4, r4, r7
	adds r0, r4, #0


ret
