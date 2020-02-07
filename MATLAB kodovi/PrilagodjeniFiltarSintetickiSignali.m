% Pravougli, Testerasti i Sinusni signal!
clc
clear all
close all
global fs

t = 0:0.1:10;
fs = 1;

% Trougaoni signal: 
figure(1);
w = 5;
x = tripuls(t-5,w);
y = awgn(x,10,'measured');
Funkcija_Prilagodjeni_Filtar( x,y,t,t );


%Pravougaoni signal:
figure(2);
x = 5*((t>0)&(t<5));
y = awgn(x,10,'measured');
Funkcija_Prilagodjeni_Filtar( x,y,t,t );

% Sinusni:
figure(3);
x = 2*sin(2*pi*t);
y = awgn(x,10,'measured');
Funkcija_Prilagodjeni_Filtar( x,y,t,t );

