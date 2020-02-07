function [] = Funkcija_Prilagodjeni_Filtar( x,y,t_x,t_y )
global fs

subplot(4,1,1);
plot(t_y,y);
title('Signal za analizu!');

%Kreiranje h(t) i konvolucija:
%T = floor(length(y)/2); %5s!
T=length(x);
for(i=1:length(x))
    if(i>T)
        h(i)=0;
    else
        h(i) = (1/100)* x(T-i+1);
    end
end
subplot(4,1,2);
plot(t_x,h);
title('Impulsni odziv!');

K = conv(y,h); %xcorr
t1=[0:length(K)-1]/fs; % kreiramo vektor vremena
subplot(4,1,3);
plot(t1,K);
title('Odziv filtra!');


%Idealno:
subplot(4,1,4);
K1 = conv(x,h); %xcorr
t2=[0:length(K1)-1]/fs; % kreiramo vektor vremena
plot(t2,K1);
title('Idealna konvolucija!');
%STEPEN SLICNOSTI:
fprintf('Kvantitativna vrijednost korelacije: \n');
idealno = x*x'/length(x);
%stvarno = y*x'/length(y);
stvarno=0;
for(i=1:min(length(x),length(y)))
    stvarno=stvarno+y(i).*x(i);
end
stvarno=stvarno/length(y);
fprintf('Idealno: %f\n',idealno);
fprintf('Stvarno: %f\n',stvarno);
if(idealno>stvarno)
    kolicnik=abs(stvarno/idealno);
else
    kolicnik=abs(idealno/stvarno);
end    
fprintf('Postotak slicnosti: %.2f\n',kolicnik*100);
end

