% Blokovska odredjivanje stepena slicnosti deterministickog signala:
% Vrsi se tako sto se svaki put pomjeramo za jedan odmjerak, sve dok ne
% dodjemo do kraja, odnosno, imamo analizu na 'nivou' jednog odmjerka!

%Idealna konvolucija signala sa samim sobom:
idealno = pcela*pcela'/length(pcela);
fprintf('Idealno: %f\n',idealno);

% Odredjivanje stepena slicnosti na nivou bloka!
% U ovom slucaju, uzeli smo blok od 482, do 485 sekundi, odnosno blok od
% 3 sekunde!
for(i=482*fs:485*fs)
     stvarno=0;
    for(j=1:length(pcela))
       stvarno=stvarno+y(i+j)*pcela(j)/length(pcela);
    end
    
    fprintf('Stvarno: %.5f\n',stvarno);
    if(idealno>stvarno)
        if(stvarno<0)
            kolicnik=0;
        else
            kolicnik=abs(stvarno/idealno);
        end
    else
         kolicnik=abs(idealno/stvarno);
    end    
    fprintf('Od odmjerka %d,Postotak slicnosti: %.5f\n',i,kolicnik*100);
    stepen_slicnosti(i)=kolicnik*100;
end


