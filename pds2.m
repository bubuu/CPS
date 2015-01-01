function [P,nsgmts,v]=pds(x,y,N,windo,overlap)
% [P,nsgmts,v]=pds(x,y,N,windo,overlap)
%
% Gestosc widmowa mocy usredniona po segmentach rekordu sygnalu x.
% 
% Sygnaly wejsciowe:
%  x,y     = wektory sygnalow wejsciowych (x,x dla widma "wlasnego" sygnalu x;
%            rozne wektory dla widma skrosnego).
%  N       = dludosc segmentu (liczba parzysta).  # prazki widmowe=N/2+1.
%  windo   = okno danych typu:
%                1) Boxcar            4) Hanning
%                2) Tapered           5) Hamming
%                3) Triangular        6) Blackman
%  overlap = czesc kazdego segmentu danych o dlugosci N ktora "zachodzi" na segment poprzedni.
%            Powinna byc wieksza od 0 i mniejsza od 1.
% Sygnaly wyjsciowe:
%  P       = gestosc widmowa mocy, P(1:N), zdefiniowna w taki sposob, ze
%            P(n)=P(N-n+2) dla n=2,...,N.  Jesli y=x, P = usredniony periodogram x;
%            zatem suma (P)/N ~= wartosc srednia(x.^2).
%  nsgmts  = liczba zachodzacych segmentow podlegajacych usrednieniu.
%  v       = wektor czestotliwosci. P(n) jest okreslona dla v(n) Hz-s.
% Patrz takze power_gain, gain, gain_f

x=row_vec(x);
y=row_vec(y);
L=min(length(x),length(y));

if(N<8 | mod(N,2)==1),
   error('pds: DFT size must be even and at least 8.');
elseif L<N,
   error('pds: Length of x and/or y is < DFT size.');
end

P=zeros(1,N);
nshift=min(N,max(1,round(N*(1-overlap))));
nsgmts=fix(1+(L-N)/nshift);
w=window2(N,windo);
for isegmt=0:nsgmts-1
   xx=w.*x((nshift*isegmt+1):(nshift*isegmt+N));
   yy=w.*y((nshift*isegmt+1):(nshift*isegmt+N));
   P=P+conj(fft(xx)).*fft(yy);
end
% Komentarz: dzielenie przez w*w' uwzglednia dzielenie przez  N 
%       zgodnie z definicja periodogramu - wzor (*)  instrukcji do cwiczen "IV - Wyznaczanie widm losowych sygnalow pomiarowych".
P=P/(nsgmts*w*w');
v=[0:N-1]/N;
return
