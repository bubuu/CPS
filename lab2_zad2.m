%Malgorzata Targan
% 131420
% lab 2

clear all 
close all
N2 = 15;
n = [0: N2-1];

Ts = 1
t = 0:Ts:16
Tsr = 16/(4*length(t)-1)
t2 = 0:Tsr:16

Fs = 1
xt = exp(-t/4).*sin(2*pi*t/4);

figure
subplot(2,1,1);
plot(t,xt,'.'); 
xlabel('t[s]'); 
ylabel('x(t)'); 
title('Syganl dyskretny x');

y = reconst(xt, t2);

subplot(2,1,2);
plot(t2,y,'.'); 
xlabel('t[s]'); 
ylabel('y(t)'); 
title('Sygnal resamplowany x')
