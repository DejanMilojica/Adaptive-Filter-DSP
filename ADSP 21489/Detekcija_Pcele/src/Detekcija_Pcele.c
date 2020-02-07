/*****************************************************************************
 * Detekcija_Pcele.c
 *****************************************************************************/

#include <sys/platform.h>
#include "adi_initialize.h"
#include "Detekcija_Pcele.h"
#include "Pcela.h"
#include<stdio.h>
#include"Signal_za_analiziranje.h"
#include<filter.h>
#include<stdlib.h>

#pragma section("seg_hp2")
float pcela[LEN_PCELA] = {0.0};
#pragma section("seg_hp2")
float impulsni_odziv[LEN_PCELA]={0.0};
#pragma section("seg_hp3")
float konvolucija[LEN_PCELA+LEN_PCELA-1]={0.0}; //LEN_SIGNAL!
#pragma section("seg_hp3")
float signal_za_analizu[LEN_SIGNAL] = {0.0};

void main(){

	/*Kopiranje signala za analizu!*/
	for(int i=0;i<LEN_SIGNAL;i++)
		signal_za_analizu[i] = SIGNAL[i];

	/*Kreiranje impulsnog odziva: */
	int T=LEN_PCELA-1;

		for(int i=0;i<LEN_PCELA;i++){
			pcela[i] = PCELA[i];

		    if(i>T)
		    	impulsni_odziv[i]=0;
		    else
		    	impulsni_odziv[i] = (1/1)* pcela[T-i];
		}

		/*Propustanje signala za analizu kroz filtar!*/
		/*signal_za_analizu,LEN_SIGNAL*/
		convolve(impulsni_odziv,LEN_PCELA,pcela,LEN_PCELA,konvolucija);


	printf("KRAJ!");
}
