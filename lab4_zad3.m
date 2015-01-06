% Malgorzata Targan
% 131420   
% laboratorium 2

clear all
close all

N = 200;
A = 1;
B = 0;

vn=sqrt(A)*randn(1,N);

p=10;
n=1:N;
sn=zeros(1,N);
sn(1:p)=cos(2*pi*n(1:p)/10);
xn=sn+vn;

b=sn(p:-1:1);
y=filter(b,1,xn);

SNR10=10*log10(var(y)/var(vn))
subplot(3,1,1);
plot(n,sn);
ylabel('s(n)'); 
xlabel('n'); 
title('Sygna³');
subplot(3,1,2);
plot(n,xn);
ylabel('x(n)'); 
xlabel('n'); 
title('Sygna³ + szum');
subplot(3,1,3);
plot(n,y);
ylabel('y(n)'); 
xlabel('n'); 
title('Wyjscie filtru dopasowanego');

p=100;
sn(1:p)=1/sqrt(10)*cos(2*pi*n(1:p)/10);
xn=sn+vn;

b=sn(p:-1:1);
y=filter(b,1,xn);
SNR100=10*log10(var(y)/var(vn))

figure
subplot(3,1,1);
plot(n,sn);
ylabel('s(n)'); 
xlabel('n'); 
title('Sygna³');
subplot(3,1,2);
plot(n,xn);
ylabel('x(n)'); 
xlabel('n'); 
title('Sygna³ + szum');
subplot(3,1,3);
plot(n,y);
ylabel('y(n)'); 
xlabel('n'); 
title('Wyjscie filtru dopasowanego');



