% Malgorzata Targan
% 131420   
% laboratorium 2

clear all
close all

N = 8000;
A = 50
n = 0:N-1;
d = 2;
seg = 20;

n1 = sqrt(A)*randn(1,N);
n2 = sqrt(A)*randn(1,N);

s = sin(0.1*pi*n);

x = s+n1;

y = n2;

y(d+1:end) = y(d+1:end)+s(1:end-d);

figure()
subplot(2,1,1)
plot(x)
title('Sygnaly pomiarowe z czujnikow')
ylabel('x(n)'); 
xlabel('n');
subplot(2,1,2)
plot(y)
ylabel('y(n)'); 
xlabel('n');

%gestosc widmowa mocy
[Pyy]=pds2(y,y,seg,1,0.75);
Psum = sum(Pyy)/seg

figure
subplot(1,3,1);

bar([0:seg-1]/seg,Pyy); 
ylabel('Pyy(v)'); 
xlabel('v(Hz-s)'); 

axis([0,0.5,0,max(Pyy)]);

subplot(1,3,2);

[Pxx]=pds2(x,x,seg,1,0.75);
Psum = sum(Pxx)/seg

bar([0:seg-1]/seg,Pxx); 
ylabel('Pxx(v)'); 
xlabel('v(Hz-s)'); 
axis([0,0.5,0,max(Pyy)]);

[Pxy]=pds2(x,y,seg,1,0.75);

koh = (abs(Pxy).^2)./(Pxx.*Pyy);

subplot(1,3,3)
bar([0:seg-1]/seg,koh); 
ylabel('\Gamma^2_x(v)'); 
xlabel('v(Hz-s)'); 
xlim([0,0.5]);



