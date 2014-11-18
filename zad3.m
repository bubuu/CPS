% Malgorzata Targan KSE
% 131420
% zadanie 3 lab 1

clear all
close all

N = 450;
n = 0:N-1;

Ts = 0.1e-6;
Fs = 1/Ts;

fMhz = n/(N*Ts)/10^6;
t = n*Ts;


x = sin(2*pi*n/25).*exp(-n/75);
X = fft(x);
amplitude = abs(X);
phase = unwrap(angle(X));

phaserad = rad2deg(phase);

subplot(131);
plot(n, x);
xlabel('n');
ylabel('x[n]');
title('Signal');
subplot(132);
plot(fMhz, phaserad);
xlabel('f[MHz]');
ylabel('\phi');
title('Phase');
subplot(133);
plot(t(1:(floor(length(t)/2))), amplitude(1:(floor(length(t)/2))));
xlabel('t');
ylabel('x[t]');
title('DFT Magnitude');
