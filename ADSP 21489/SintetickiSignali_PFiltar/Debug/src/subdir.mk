################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/SintetickiSignali_PFiltar.c 

SRC_OBJS += \
./src/SintetickiSignali_PFiltar.doj 

C_DEPS += \
./src/SintetickiSignali_PFiltar.d 


# Each subdirectory must supply rules for building sources it contributes
src/SintetickiSignali_PFiltar.doj: ../src/SintetickiSignali_PFiltar.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="SintetickiSignali_PFiltar" -proc ADSP-21489 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -DCORE0 -D_DEBUG @includes-940a821f205263e79451512c09cd9747.txt -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/SintetickiSignali_PFiltar.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


