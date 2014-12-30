function b=fir_lowpass_weights(N,vc)
% b=fir_lowpass_weights(N,nu)
%
% b   =nieokienkowany wektor wierszowy wspolczynnikow filtru FIR o liniowej fazie.
% N   =dlugosc of b (odpowiedzi impulsowej). (powinna byc liczba nieparysta).
%     (Jesli N jest liczba parzysta, to zostaje zamieniona na N+1 z ostrzezeniem.)
% vc =czestotliwosc odciecia w Hz-s.
% Ptrz takze skrypt: fir_weights
L=fix(N/2);
% Sprawdz bledy.
if(2*L+1~=N),
   N=2*L+1;
   fprintf('Uwaga: # wspolczynnikow wzroslo do %5.0f.\n',N);
end
if(vc>=.5 | vc<=0),
   error('cCzestotliwosc odciecia vc musi byc > 0 oraz < 0.5 Hz-s.');
end
k=1:L;
b1=sin(2*pi*vc*k)./(pi*k);
b=[b1(L:-1:1) 2*vc b1(1:L)];