%Malgorzata Targan
% 131420
% lab 2

clear all
close all

T = [0.04 0.07];
Tmax = max(T);
Fmax = 40;
%N = ceil(Tmax*Fmax);
N = 3;
n = 0:N-1;
m(1,:) = n/T(1);
m(2,:) = n/T(2);
f= 0:0.1:Fmax;


X = zeros(2,length(f));

for i=1:length(f)
    X(1,i)=1/T(1)*sum(10*exp((-abs(f(i)-m(1,:)))/2));
    X(2,i)=1/T(2)*sum(10*exp((-abs(f(i)-m(2,:)))/2)); 
end

% subplot(3,1,1)
% plot(f,10*exp(-abs(f)/2));
% subplot(3,1,2)
subplot(2,1,1)
plot(f,abs(X(1,:))); 
title('T = 0.04s'); 
xlabel('f[Hz]'); 
ylabel(['|X(j\omega)|']) 
% subplot(3,1,3)
subplot(2,1,2)
plot(X(:,2))
plot(f,abs(X(2,:))); 
title('T = 0.07s'); 
xlabel('f[Hz]'); 
ylabel(['|X(j\omega)|']) 