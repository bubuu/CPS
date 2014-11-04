%Malgorzata Targan
% 131420
% lab 2

clear all 
close all

Fs = [30 20 15]

N1 = 128;
n = [0: N1-1];

w(:,1) = 2*pi*n/N1;
w(:,2) = 2*pi*n/N1;
w(:,3) = 2*pi*n/N1;

f(:,1) = n*Fs(1)/N1;
f(:,2) = n*Fs(2)/N1;
f(:,3) = n*Fs(3)/N1;

x(:,1) = 3 + 2*sin(16*pi*n/Fs(1)) + 10*cos(24*pi*n/Fs(1));
x(:,2) = 3 + 2*sin(16*pi*n/Fs(2)) + 10*cos(24*pi*n/Fs(2));
x(:,3) = 3 + 2*sin(16*pi*n/Fs(3)) + 10*cos(24*pi*n/Fs(3));


X(:,1) = fft(x(:,1),N1);
X(:,2) = fft(x(:,2),N1);
X(:,3) = fft(x(:,3),N1);

figure(1)
subplot(2,1,1);
stem(w(1:length(w(:,1))/2,1), abs(X(1:length(X(:,1))/2,1)./max(X(:,1))));
xlabel('\omega[rad]');ylabel('X');title('Widmo amplitudowe dla Fs = 30')

subplot(2,1,2);
stem(f(1:length(f(:,1))/2,1), abs(X(1:length(X(:,1))/2,1)./max(X(:,1))));
xlabel('f[Hz]');ylabel('X');title('Widmo amplitudowe dla Fs = 30')


figure(2)
subplot(2,1,1);
stem(w(1:length(w(:,2))/2,2), abs(X(1:length(X(:,2))/2,2)./max(X(:,2))));
xlabel('\omega[rad]');ylabel('X');title('Widmo amplitudowe dla Fs = 20')

subplot(2,1,2);
stem(f(1:length(f(:,2))/2,2), abs(X(1:length(X(:,2))/2,2)./max(X(:,2))));
xlabel('f[Hz]');ylabel('X');title('Widmo amplitudowe dla Fs = 20')

figure(3)
subplot(2,1,1);
stem(w(1:length(w(:,3))/2,3), abs(X(1:length(X(:,3))/2,3)./max(X(:,3))));
xlabel('\omega[rad]');ylabel('X');title('Widmo amplitudowe dla Fs = 15')

subplot(2,1,2);
stem(f(1:length(f(:,3))/2,3), abs(X(1:length(X(:,3))/2,3)./max(X(:,3))));
xlabel('f[Hz]');ylabel('X');title('Widmo amplitudowe dla Fs = 15')

%Y=[X(1:(N+1)/2), zeros(1,K*N), X((N+1)/2+1:N)]; 
%xr =  =(K+1)*ifft(Y); 



