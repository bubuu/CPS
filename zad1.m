% Malgorzata Targan KSE
% 131420
% zadanie 1 lab 1

clear all
close all

N = 300;
n = [0:N-1];
m = [0:N-1];

x = 2*sin(2*pi*n/50).*exp(-n/100);

% DFT, X
X = x*exp(-1i*2*pi*m'*n/N);

figure
plot(n,x,'o');
set(gcf,'color','white');
xlabel('n');
ylabel('x[n]');
title('Signal');

figure
plot(m,X,'x');
set(gcf,'color','white');
xlabel('m');
ylabel('|Xm|');
title('DFT Mgnitude');



