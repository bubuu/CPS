%Malgorzata Targan
% 131420
% lab 2

clear all 
close all

T = 0.07;
tdiff = 0.001;
range = [0 T -2 2];
t = 0:tdiff:T;

%sampling data
Ts = [0.003 0.002];
n1 = 0:Ts(1):T;
n2 = 0:Ts(2):T;

%generate primary signal
x = 100*t.*exp(-150*abs(t-0.02)).*sin(200*pi*t);
xn1 = 100*n1.*exp(-150*abs(n1-0.02)).*sin(200*pi*n1);
xn2 = 100*n2.*exp(-150*abs(n2-0.02)).*sin(200*pi*n2);

y1 = reconst(xn1, t);
y2 = reconst(xn2, t);

subplot(3,1,1)
plot(n1, xn1, '-o');
hold on
plot(t, y1, 'r');
title('Sygnal ponownie probkowany, Ts = 3ms');
xlabel('t[s]');
ylabel('x(t)');
axis(range);

subplot(3,1,2)
plot(t, x);
hold on 
plot(t, y1, 'r');
hold on
plot(t, y2, 'g');
title('Sygnal ciagly');
xlabel('t[s]');
ylabel('x(t)');
axis(range);
legend('Sygnal pierwotny', '3ms', '2ms');

subplot(3,1,3)
plot(n2, xn2, '-o');
hold on
plot(t, y2, 'r');
title('Sygnal ponownie probkowany, Ts = 2ms');
xlabel('t[s]');
ylabel('x(t)');
axis(range);