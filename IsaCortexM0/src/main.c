/*
 * This file is part of the µOS++ distribution.
 *   (https://github.com/micro-os-plus)
 * Copyright (c) 2014 Liviu Ionescu.
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom
 * the Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

// ----------------------------------------------------------------------------

#include <stdio.h>
#include <stdlib.h>
#include "diag/Trace.h"

unsigned long fibonacci(unsigned short n);
unsigned long fatorial(unsigned short n);
void soma(int *p1,int *p2, int n);
void SetBit(unsigned long *p, unsigned char bitn);
void ResetBit(unsigned long *p, unsigned char bitn);
void ToggleBit(unsigned long *p, unsigned char bitn);
unsigned char  ReadBit(unsigned long *p, unsigned char bitn);
unsigned long  ReadBitSlice(unsigned long *p, unsigned char bitstart, unsigned char bitend);
unsigned char IsLittleEndian (void);
// ----------------------------------------------------------------------------
//
// Standalone STM32F0 empty sample (trace via DEBUG).
//
// Trace support is enabled by adding the TRACE macro definition.
// By default the trace messages are forwarded to the DEBUG output,
// but can be rerouted to any device or completely suppressed, by
// changing the definitions required in system/src/diag/trace_impl.c
// (currently OS_USE_TRACE_ITM, OS_USE_TRACE_SEMIHOSTING_DEBUG/_STDOUT).
//

// ----- main() ---------------------------------------------------------------

// Sample pragmas to cope with warnings. Please note the related line at
// the end of this function, used to pop the compiler diagnostics status.
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wmissing-declarations"
#pragma GCC diagnostic ignored "-Wreturn-type"

int
main(int argc, char* argv[])
{
	/* FINOBACCI */
	trace_printf("\tFibonacci teste: \t%lu\n", fibonacci(5));
	/* FATORIAL */
	trace_printf("\tFatorial teste: \t%lu\n", fatorial(4));

	/* SOMA */
	int v1[4] = {3,3,3,3};
	int v2[4] = {1,2,2,1};
	soma(v1,v2, 4);
	int i;
	for (int i = 0; i < 4; i++){
		trace_printf("v1[%d] = %d v2[%d] = %d  \n",i, v1[i], i, v2[i]);
	}

	/* SetBit */
	unsigned long  x = 10;
	SetBit(&x,4);
	trace_printf("%d\n", x);


	/* ResetBit */
	unsigned long y = 10;
	ResetBit(&y, 1);
	ResetBit(&y, 3);
	trace_printf("%d\n", y);

	/* ToggleBit */
	unsigned long z = 10;
	ToggleBit(&z, 1);
	ToggleBit(&z, 0);
	trace_printf("%d\n", z);

	/* ReadBit */
	unsigned long w = 10;
	trace_printf("Retorno da funcao de leitura: %d \n", ReadBit(&w,3));


	/* ReadBitSlice */
	unsigned long a = 93;
		trace_printf("%ld \n", ReadBitSlice(&a, 2,2));


	/* isLittleEndian */
	trace_printf("%d", isLittleEndian());
  // Infinite loop
  while (1)
    {
       // Add your code here.
    }
}

#pragma GCC diagnostic pop

// ----------------------------------------------------------------------------
