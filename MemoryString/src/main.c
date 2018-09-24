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

void* mymemset ( void *ptr, int value, size_t num );
void* mymemcpy ( void * destination, const void * source, size_t num );
int mymemcmp ( const void * ptr1, const void * ptr2, size_t num );
size_t mystrlen ( const char * str );
char* mystrcpy ( char * destination, const char* source );
int mystrcmp (const char* str1, const char* str2 );

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
main(int argc, char* argv[]){

	/* TESTE MEMSET */
	trace_printf("TESTE MEMSET \n\n");
	unsigned char str[1];
	unsigned char i;
	for(i = 0; i < 50; i++){
		mymemset(str,i,1);
		if(i != str[0]){
			trace_printf("os valores de i (%d) e str[0] (%d) sao diferentes\n", i, str[0]);
			return 0;
		}

	}
	trace_printf("memset passou no teste \n\n");

	/* TESTE MSMCPY */
	trace_printf("TESTE MEMCPY \n\n");
	unsigned char str1[30];
	unsigned char str2[30] = "je m'appelle Ailson Alexandre";
	for(i = 0; i < 31; i++){
		mymemcpy(str1,str2,i);
		trace_printf("%s\n", str1);
	}
	trace_printf("\n\n");

	/* TESTE MEMCMP */
	trace_printf("TESTE MEMCMP \n\n");
	unsigned char a = 0x01;
	unsigned char b = 0x00;
	short result;
	for(i = 0; i < 255; i++){
		if(i < 64){
			a = b = i;
			result = mymemcmp(&a,&b,1);
			if(result != 0){
				trace_printf("Falhou! a = %d  b = %d  mymemcmp = %d\n", a,b,result);
				return 0;
			}
		}else if (i < 128){
			a = i;
			b = i + 1;
			result = mymemcmp(&a,&b,1);
			if(result != -1){
					trace_printf("Falhou! a = %d  b = %d  mymemcmp = %d\n", a,b,result);
					return 0;
			}
		}else{
			b = i;
			a = i + 1;
			result = mymemcmp(&a,&b,1);
			if(result != 1){
					trace_printf("Falhou! a = %d  b = %d  mymemcmp = %d\n", a,b,result);
					return 0;
			}
		}
	}
	trace_printf("memcmp passou no teste \n\n");

	/* TESTE STRLEN */
	trace_printf("TESTE STRLEN \n\n");
	char str4[30] = "Ailsonnn";
	trace_printf("Tamanho string = %d\n", mystrlen(str4));

	/* TESTE  STRCPY */
	trace_printf("TESTE STRCPY \n\n");
	char str5[6];
	char str6[6] = "AIlson";
	mystrcpy(str5,str6);
	trace_printf("%s  Tamanho: %d\n", str5, mystrlen(str5));

	/* TESTE STRCMP */
	trace_printf("TESTE STRCMP \n\n");
	char str7[6] = "Ailson";
	char str8[6] = "ailson";

	trace_printf("%d\n", mystrcmp(str7,str8)); //-1 esperado



}

#pragma GCC diagnostic pop

// ----------------------------------------------------------------------------
