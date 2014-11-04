%Malgorzata Targan
% 131420
% lab 2

clear all 
close all

Fs = [30 20 15]

N1 = 128;
N2 = 128;
n = [0: N1-1];

w(:,1) = 2*pi*n/N1;
w(:,2) = 2*pi*n/N1;
w(:,3) = 2*pi*n/N1;

f1=n*Fs(1)/N1;
f2=n*Fs(2)/N1;
f3=n*Fs(3)/N1;

x(:,1) = 3 + 2*sin(16*pi*n/Fs(1)) + 10*cos(24*pi*n/Fs(1));
x(:,2) = 3 + 2*sin(16*pi*n/Fs(2)) + 10*cos(24*pi*n/Fs(2));
x(:,3) = 3 + 2*sin(16*pi*n/Fs(3)) + 10*cos(24*pi*n/Fs(3));

%X = [ones(1,N1/2], - ones(1,N1/2)];
X(:,1) = fft(x(:,1),N1);
X(:,2) = fft(x(:,1),N1);
X(:,3) = fft(x(:,1),N1);

%Y = fft(x1,N2);
figure
stem(w1, abs(X1));
xlabel('w[rad]');ylabel('X');title('Widmo amplitudowe 1')
figure
plot(w2, abs(X2));
figure
plot(w3, abs(X3));
figure
plot(f1, abs(X1));
figure
plot(f2, abs(X2));
figure
plot(f3, abs(X3));

%Y=[X(1:(N+1)/2), zeros(1,K*N), X((N+1)/2+1:N)]; 
%xr =  =(K+1)*ifft(Y); 



