clear all
close all

T = [0.04 0.07];
N=64;
n = -N/2:(N/2-1);
m(1,:) = n/T(1);
m(2,:) = n/T(2);
f= 1:1:40;
%m = [0:M];
%m = 0:M
F = 40;
X = zeros(2,length(f));

for i=1:length(f)
    X(1,i)=1/T(1) * sum(10*exp((-abs(f(i) - m(1,:)))/2));
    X(2,i)=1/T(2) * sum(10*exp((-abs(f(i) - m(2,:)))/2)); 
end
%X(:,1) = X(:,1) + 10*exp(-1*abs(f-m/T(2))/2);
subplot(2,1,1)
plot(f,abs(X(1,:)),'-x'); 
title('przedzial probkowania = 0.04 s'); 
xlabel('Czestotliwosc [Hz]'); 
ylabel(['|X(j\omega)|']) 
% subplot(2,1,2)
% plot(X(:,2))