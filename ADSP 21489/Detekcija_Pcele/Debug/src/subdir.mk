################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Detekcija_Pcele.c 

SRC_OBJS += \
./src/Detekcija_Pcele.doj 

C_DEPS += \
./src/Detekcija_Pcele.d 


# Each subdirectory must supply rules for building sources it contributes
src/Detekcija_Pcele.doj: ../src/Detekcija_Pcele.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore SHARC C/C++ Compiler'
	cc21k -c -file-attr ProjectName="Detekcija_Pcele" -proc ADSP-21489 -flags-compiler --no_wrap_diagnostics -si-revision 0.2 -g -DCORE0 -D_DEBUG @includes-2fd3d0275a1a31e2d194e43fdbc7a166.txt -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -swc -gnu-style-dependencies -MD -Mo "src/Detekcija_Pcele.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


