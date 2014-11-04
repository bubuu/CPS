% Malgorzata Targan KSE
% 131420
% zadanie 3 lab 1

clear all
close all

N = 450;
n = 0:N;

Ts = 0.1e-6;
Fs = 1/Ts;

tMhz = n/(N*Ts)/10^6;
t = n*Ts;


x = sin(2*pi*n/25).*exp(-n/75);
X = fft(x);
amplitude = abs(X);
phase = unwrap(angle(X));

phaserad = rad2deg(phase);

subplot(121);
plot(tMhz, phaserad);
subplot(122);
plot(t, amplitude);
