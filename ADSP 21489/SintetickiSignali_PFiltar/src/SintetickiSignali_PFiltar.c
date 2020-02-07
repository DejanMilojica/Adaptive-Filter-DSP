/*****************************************************************************
 * SintetickiSignali_PFiltar.c
 *****************************************************************************/

#include<stdio.h>
#include<filter.h>
#include<stdlib.h>
#include<math.h>
#include <sys/platform.h>
#include "adi_initialize.h"
#include "SintetickiSignali_PFiltar.h"
#include "Koeficjenti_Trougaoni_Signal_BEZ_Suma.h"
#include "Koeficjenti_Trougaoni_Signal_Sa_Sumom.h"
#include "Koeficjenti_Pravougaonog_Signala_bez_Suma.h"
#include "Koeficjenti_Pravougaonog_Signala_sa_Sumom.h"
#include "Koeficjenti_Sinusnog_Signala_sa_Sumom.h"
#include "Koeficjenti_Sinusnog_Signala_bez_Suma.h"

#define LEN 101

float trougaoni_signal[LEN_TSS]={0};
float trougaoni_signal_sa_sumom[LEN_TSBS]={0};

float pravougaoni_signal[LEN_PSBS]={0};
float pravougaoni_signal_sa_sumom[LEN_PSS]={0};

float sinusni_signal[LEN_SSBS]={0};
float sinusni_signal_sa_sumom[LEN_SSS]={0};

float konvolucioni_signal[2*LEN-1]={0};
float impulsni_odziv[LEN]={0};

void funkcija_prilagodjeni_filtar(float signal[], float signal_sa_sumom[],int M, int N);
void kopiranje_signala(float signal[], const float original[], int n);
void stepen_slicnosti(float signal[], float signal_sa_sumom[],int M, int N);

int main(int argc, char *argv[])
{
	/* Prilagodjeni Filtar, testiranje na sintetickim signalima! */

	/*Trougaoni signal!*/
	kopiranje_signala(trougaoni_signal, TSBS ,LEN_TSBS); //Signal bez suma!
	kopiranje_signala(trougaoni_signal_sa_sumom,TSS ,LEN_TSS); //Signal sa sumom!
	funkcija_prilagodjeni_filtar(trougaoni_signal, trougaoni_signal_sa_sumom,LEN_TSBS,LEN_TSS);
	stepen_slicnosti(trougaoni_signal, trougaoni_signal_sa_sumom,LEN_TSBS,LEN_TSS);

	/*Pravougaoni signal!*/
	kopiranje_signala(pravougaoni_signal,PSBS ,LEN_PSBS); //Signal bez suma!
	kopiranje_signala(pravougaoni_signal_sa_sumom,PSS ,LEN_PSS); //Signal sa sumom!
	funkcija_prilagodjeni_filtar(pravougaoni_signal, pravougaoni_signal_sa_sumom,LEN_PSBS,LEN_PSS);
	stepen_slicnosti(pravougaoni_signal, pravougaoni_signal_sa_sumom,LEN_PSBS,LEN_PSS);

	/*Sinusni signal!*/
	kopiranje_signala(sinusni_signal,SSBS ,LEN_SSBS); //Signal bez suma!
	kopiranje_signala(sinusni_signal_sa_sumom,SSS ,LEN_SSS); //Signal sa sumom!
	funkcija_prilagodjeni_filtar(sinusni_signal, sinusni_signal_sa_sumom,LEN_SSBS,LEN_SSS);
	stepen_slicnosti(sinusni_signal, sinusni_signal_sa_sumom,LEN_SSBS,LEN_SSS);

	/*Primjer sa pravougaonim signalom, u kome trazimo sinusnu referencu!*/
	funkcija_prilagodjeni_filtar(sinusni_signal, pravougaoni_signal_sa_sumom,LEN_SSBS,LEN_PSS);
	stepen_slicnosti(sinusni_signal, pravougaoni_signal_sa_sumom,LEN_SSBS,LEN_PSS);

	return 0;
}

void funkcija_prilagodjeni_filtar(float signal[], float signal_sa_sumom[],int M, int N){
	//Kreiranje h(t) i konvolucija:
	int T=LEN-1;

	for(int i=0;i<LEN;i++){
	    if(i>T)
	    	impulsni_odziv[i]=0;
	    else
	    	impulsni_odziv[i] = (1/1)* signal[T-i];
	}
	convolve(impulsni_odziv,M,signal_sa_sumom,N,konvolucioni_signal);
}

void kopiranje_signala(float signal[], const float original[], int n){
	for(int i=0;i<n;i++){
		signal[i] = original[i];
	}
}

void stepen_slicnosti(float signal[], float signal_sa_sumom[],int M, int N){
	printf("Kvantitativna vrijednost korelacije: \n");

	float idealno = 0.0;
	for(int i=0;i<M;i++)
		idealno+=signal[i]*signal[i];
	idealno/=M;

	float stvarno = 0.0;
	for(int i=0;i<M;i++)
		stvarno+=signal_sa_sumom[i]*signal[i];
	stvarno/=N;

	printf("Idealno: %f\n",idealno);
	printf("Stvarno: %f\n",stvarno);
	float kolicnik=0.0;
	if(idealno>stvarno)
	    kolicnik=stvarno/idealno;
	else
	    kolicnik=idealno/stvarno;

	printf("Postotak slicnosti: %.5f [%%]\n",kolicnik<0?0:kolicnik*100);
}
