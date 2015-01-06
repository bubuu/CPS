% Malgorzata Targan
% 131420   
% laboratorium 2

clear all
close all
K = 4000;
k = 0:3999;
A = 100;
B = 0;
seg = 40;

n=sqrt(A)*randn(1,K);

x = sin(0.1*pi*k);
y = cos(0.1*pi*k);
SNR=10*log10(var(y)/var(n))

y = cos(0.1*pi*k)+n;
%gestosc widmowa mocy
[P]=pds2(y,y,seg,1,0.75);
Psum = sum(P)/seg

figure
subplot(1,2,1);

bar([-seg/2:seg/2-1]/seg,P); 
ylabel('Py(v)'); 
xlabel('v(Hz-s)'); 
title('segment 40 probek, zachodzenie 75%');
axis([0,0.5,0,max(P)]);

subplot(1,2,2);

[P2]=pds2(x,y,seg,1,0.75);
Psum = sum(P2)/seg

bar([-seg/2:seg/2-1]/seg,P2); 
ylabel('Pxy(v)'); 
xlabel('v(Hz-s)'); 
title('segment 40 probek, zachodzenie 75%');
axis([0,0.5,0,max(P)]);
