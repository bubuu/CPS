% Malgorzata Targan
% 131420   
% laboratorium 2

clear all
close all

N = 8000;
A = 3;
B = 0;
n = [1:N];
seg = 80;

x = sqrt(12)*sqrt(A)*(rand(1,N)-0.5);

%rozklad amplitudowy
range = B-(A+1):0.5:B+(A+1);
[y,c] = hist(x,range);
bar(c, y/sum(y));
title('Rozklad amplitudowy');
ylabel('p(x)'); 
xlabel('x'); 
axis([B-(A+1) B+(A+1) 0 0.1]);

%gestosc widmowa mocy

[P]=pds2(x,x,N,5,0);
Psum = sum(P)/seg

figure
subplot(1,3,1);

%bar([-seg/2:seg/2-1]/seg,P); 
plot((-N/2:N/2-1)/N, P)
ylabel('P(v)'); 
xlabel('v(Hz-s)'); 
title('Periodogram');
axis([-0.5,0.5, min(P),max(P)]);


[P]=pds2(x,x,seg,5,0);
Psum = sum(P)/seg

subplot(1,3,2);

bar([-seg/2:seg/2-1]/seg,P); 
ylabel('P(v)'); 
xlabel('v(Hz-s)'); 
title('bez zachodzenia');
axis([0,0.5,0,4]);

[P2]=pds2(x,x,seg,5,0.75);
Psum = sum(P2)/seg

subplot(1,3,3);

bar((-seg/2:seg/2-1)/seg,P2); 
ylabel('P(v)'); 
xlabel('v(Hz-s)'); 
title('z zachodzeniem 75%');
axis([0,0.5,0,4]);