% Malgorzata Targan
% 131420    
% laboratorium 3

clear all
close all

N = 5000
A = 27
B = 0
n = [1:N]


%calculate distribution
x = sqrt(12)*sqrt(A)*(rand(1,N)-0.5)

%calculate periodogram
p1 = (1/N).*abs(fft(x)).^2;

%scale
Hzs = n./N;

subplot(1,3,1);
plot(Hzs,p1);
title('Periodogram');
xlabel('\nu [Hz-s]');  
ylabel('PSD');  
axis([0 0.5 0 100]);

M = 100;
m = 1:M;
p2 = zeros(1,M);
for i=1:2*(N/M)-1
    xm = x(1+M/2*(i-1):M/2*(i+1));
    pm = (1/M).*(abs(fft(xm)).^2);
    p2 = p2+pm;
end

%scale
Hzs = m./M;

subplot(1,3,2);
bar(Hzs, p2./(2*N/M));
title('Periodogram (segmenty 100 probek)');
xlabel('\nu [Hz-s]');  
ylabel('PSD');  
axis([0 0.5 0 100]);

M = 40;
m = 1:M;
p3 = zeros(1,M);
for i=1:2*(N/M)-1
    xm = x(1+M/2*(i-1):M/2*(i+1));
    pm = (1/M).*(abs(fft(xm)).^2);
    p3 = p3+pm;
end

%scale
Hzs = m./M;

subplot(1,3,3);
bar(Hzs, p3./(2*N/M));
title('Periodogram (segmenty 40 probek)');
xlabel('\nu [Hz-s]');  
ylabel('PSD');  
axis([0 0.5 0 100]);



