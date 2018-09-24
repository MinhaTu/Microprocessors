


.syntax unified
.text
.macro ret
	bx lr
.endm

.globl mymemcpy

mymemcpy:

	subs r3, r2,#0 //verifica se o numero de bytes para copiar é 0
	beq fim
	laco:
		ldrb r3,[r1]   //carrega 1 byte pra r3
		strb r3, [r0]  // escreve conteúdo de r3 no endereço apontado por r0
		adds r0, #1	   //Avança 1 byte
		adds r1, #1
		//condicao do laco
		subs r2, #1
		subs r3,r2,#0
		bne laco

	fim: ret
