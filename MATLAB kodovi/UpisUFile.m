% Skripta, kojom vrsimo formiranje koeficjenata signala za analiziranje, na
% osnovu 'poznatog' zvuka, koji usljed hardverskih ogranicenja, ne moze se
% analizirati cjelokupan!
clc

%Formiranje datoteke!
fid = fopen('Signal_za_analiziranje.h','w');
i=1;
% Upis potrebnih parametara!
fprintf(fid,'%s','#define LEN_SIGNAL ');
fprintf(fid,'%d\n',fs*60); 
fprintf(fid,'%s','const float SIGNAL[LEN_SIGNAL] = {'); 
i=fs*510;
j=1;
% Upis koeficjenata!
while(i<=fs*550)
    fprintf(fid,'%6.5f,\n',y(i));
    signal_za_analizu(j)=y(i);
    j=j+1;
   i=i+1;
end
fprintf(fid,'%s','};');
fclose(fid);

% Prikaz signala, te formiranje audio oblika!
t_a=[0:length(signal_za_analizu)-1]/fs; % kreiramo vektor vremena
plot(t_a,signal_za_analizu);
audiowrite('Zvuk_za_analizu.wav',signal_za_analizu,fs);


% Citanje koeficjenata, te njihov prikaz!

%t=[0:length(y)-1]/fs; % kreiramo vektor vremena
%subplot(2,1,1);
%plot(t,y);

%fid = fopen('Koeficjenti.txt','r');
%S=fscanf(fid,'%f,\n');
%fclose(fid);

%subplot(2,1,2);
%plot(t,S);
%sound(S,fs);



