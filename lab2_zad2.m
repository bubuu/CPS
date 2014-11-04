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
xlabel('t [s]'); 
ylabel('x(t)'); 
title('Pierwotny');

y = reconst(xt, t2);

subplot(2,1,2);
plot(t2,y,'.'); 
hold all %dla porownania
t=0:Ts:16;
plot(t,xt,'or'); 
xlabel('t [s]'); 
ylabel('resamplowany x(t)'); 
title('Resamplowany')


% clc;
% clear all
% close all;
% 
% T=1;
% tk=16;
% t=0:T:tk;
% x=exp(-t/4).*sin(2*pi*t/5);
% figure
% subplot(2,1,1);
% plot(t,x,'.'); 
% xlabel('t [s]'); 
% ylabel('x(t)'); 
% title('Pierwotny');
% 
% xres=resamp(x,4*length(x));
% subplot(2,1,2);
% p=16/(length(xres)-1);
% t=0:p:16;
% plot(t,xres,'.'); 
% %hold all %dla porownania
% %t=0:T:tk;
% %plot(t,x,'or'); 
% xlabel('t [s]'); 
% ylabel('resamplowany x(t)'); 
% title('Resamplowany')