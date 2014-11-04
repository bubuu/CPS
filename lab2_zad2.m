%Malgorzata Targan
% 131420
% lab 2

clear all 
close all
N2 = 15;
n = [0: N2-1];

K = 3;
w0 = 2*pi;
Ts = 1
t = 0:Ts:16
Fs = 1
xt = exp(-t/4).*sin(2*pi*t/4);
xn = exp(-n/Fs/4).*sin(2*pi*n/Fs/4);
X = fft(xn,N2);

Y=[X(1:(N2+1)/2), zeros(1,K*N2), X((N2+1)/2+1:N2)]; 
xr = (K+1)*ifft(Y); 
figure
plot(t, xt,'o')
figure
plot(xr)