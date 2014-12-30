function b=fir_weights(N,band,windo,v1,v2)
% b=fir_weights(N,band,windo,v1,v2)
%
% b    =filtr FIR o liniowej fazie okienkowany o wspolczynnikach tworzacych wektor wierszowy.
% N    =dlugosc b. N musi byc liczba nieoparzysta.
%       (Jesli N jest liczba parzysta, to zostaje ona zmieniona na N+1 z zastrze¿eniem.)
% band =1 (dolnoprzepustowy), 2 (gornoprzepustowy), 3(pasmowoprzepustowy), or 4 (pasmowozaporowy).
% windo=1 (boxcar),  2 (tapered),  3(tent)  4 (hanning),
%       5 (hamming), 6(blackman), or 7(kaiser) 
%        (W tym ostatnim przypadku windo jest wektorem=[7,beta], gdzie beta
%         jest z zakresu [4.0,9.0].)
% v1   =odciecie lub dolne zbocze pasma w Hz-s.
% v2   =gorne zbocze pasma w Hz-s. Wymagane jedynie dla pasmowoprzeustowego i pasmowozaporowego.
% Zobacz tez: fir_lowpass_weights
L=fix(N/2); beta=0; vm=[0 .5 0 0];
% Sprawdz bledy.
if(2*L+1~=N),
   N=2*L+1
   fprintf('Uwaga: # wspolczynnikow wzrosli do %5.0f.\n',N);
end
if(band==3 | band==4),
   if(nargin<5)'
      error('fir_weights: 2 powinna zostac wybrana dla filtrow pasmowych');
   else
      if(v2<=v1|v2>.5),
         error('fir_weights: v2 musi byc > v1 oraz < 0.5.');
      end
   end
end
if(v1<0|v1>0.5),   
    error('fir_weights: v1 musi byc >= 0 oraz <= 0.5.');
elseif(windo(1)<1 | windo(1)>7)
    error('Trzeci argument (windo(1)) musi byc z zakresu [1,7]');
end
if(windo(1)==7)
    if(length(windo)~=2)
        error('Beta nie zostalo wlasciwie dobrane dla okna Kaisera.');
    end
    beta=windo(2);
end
% Wspolczynniki filtrow Allpass oraz dolnoprzepustowych.
k=[0:L-1];
bAP=[zeros(1,L),1,zeros(1,L)];
bL=sin(2*pi*v1*(k-L))./(pi*(k-L));
bLP1=[bL,2*v1,bL(L:-1:1)];
% Konwersja do jednego z czterech pasm filtrow.
if(band==1),
   b=bLP1;
elseif(band==2),
   b=bAP-bLP1;                          
elseif(band==3 | band==4),
   b2=sin(2*pi*v2*(k-L))./(pi*(k-L));
   bLP2=[b2,2*v2,b2(L:-1:1)];
   if(band==3),
      b=bLP2-bLP1;                      
      vm(3)=(v1+v2)/2;                   % Srodek pasma.
   elseif(band==4),
      b=bAP-(bLP2-bLP1);                 
   end
else
   error('fir_weights: pasmo musi byæ = 1, 2, 3, or 4');
end
% Zastosuj okno do wspolczynnikow i wymus maksymalne wzmocnienie rowne 1.
b=b.*window(N,windo(1),beta);
b=b/abs(gain_f(b,1,vm(band)));          