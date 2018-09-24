################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
ASM_SRCS += \
../src/ReadBit.asm \
../src/ReadBitSlice.asm \
../src/ResetBit.asm \
../src/SetBit.asm \
../src/ToggleBit.asm \
../src/fatorial.asm \
../src/fibonacci.asm \
../src/isLittleEndian.asm \
../src/soma.asm 

C_SRCS += \
../src/_write.c \
../src/main.c 

OBJS += \
./src/ReadBit.o \
./src/ReadBitSlice.o \
./src/ResetBit.o \
./src/SetBit.o \
./src/ToggleBit.o \
./src/_write.o \
./src/fatorial.o \
./src/fibonacci.o \
./src/isLittleEndian.o \
./src/main.o \
./src/soma.o 

ASM_DEPS += \
./src/ReadBit.d \
./src/ReadBitSlice.d \
./src/ResetBit.d \
./src/SetBit.d \
./src/ToggleBit.d \
./src/fatorial.d \
./src/fibonacci.d \
./src/isLittleEndian.d \
./src/soma.d 

C_DEPS += \
./src/_write.d \
./src/main.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.asm
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wall -Wextra  -g3 -x assembler-with-cpp -DDEBUG -DUSE_FULL_ASSERT -DTRACE -DOS_USE_TRACE_SEMIHOSTING_DEBUG -DSTM32F051 -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000 -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/stm32f0-stdperiph" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Cross C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m0 -mthumb -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -ffreestanding -fno-move-loop-invariants -Wall -Wextra  -g3 -DDEBUG -DUSE_FULL_ASSERT -DTRACE -DOS_USE_TRACE_SEMIHOSTING_DEBUG -DSTM32F051 -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000 -I"../include" -I"../system/include" -I"../system/include/cmsis" -I"../system/include/stm32f0-stdperiph" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


