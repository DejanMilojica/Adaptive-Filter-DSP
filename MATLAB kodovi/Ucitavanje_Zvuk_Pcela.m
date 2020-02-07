%Vrsimo ucitavanje signala za analizu, te pozivom adekvatne f-je,
%ostvarujemo detekciju signala pcele, na ucitanom signalu!
close all
clear all
clc
figure(1);
global fs

%Ucitavanje zvuka za analizu:
[y, fs]=audioread('TH3Zvuk Minute od 070 do 080 kanal_1.wav'); % ucitavanje podataka
t=[0:length(y)-1]/fs; % kreiramo vektor vremena

% Generisanje signala koji reprezentuje zvuk pcele:
j=1;
for(i=23858100+0.8*fs:23946300)
   pcela(j)=y(i);
    j=j+1;
end

%PCELA:
t2=[0:length(pcela)-1]/fs; % kreiramo vektor vremena signala 'pcela'!
sound(pcela,fs); %Reprodukcija zvuka zujanja pcele!
audiowrite('pcela.wav',pcela,fs); % Cuvanje zvuka u obliku wav datoteke!

%Poziv funkcije, kojom vrsimo detekciju signala pcele, na signalu za
%analizu!
Funkcija_Prilagodjeni_Filtar(pcela,y,t2,t);
