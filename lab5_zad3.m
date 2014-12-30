clear all
close all

L1 = 33;
L2 = 133;

fc=1;
fs=20;
T=1/fs;
vc1=fc/fs;
vc2=vc1;
N=1000;
m = 1:N;
h1=zeros(N, 1);
h2=zeros(N, 1);

h1 = fir_lowpass_weights(2*L1+1, vc1);
h2 = fir_lowpass_weights(2*L2+1, vc2);


figure(1)
subplot(2,1,1);
stem(h1);
subplot(2,1,2);
stem(h2);

h1 = abs(fft(h1));
h1 = 20 * log10(h1/h1(1,1));

h2 = abs(fft(h2));
h2 = 20 * log10(h2/h2(1,1));

figure(2)
hold on;
plot(h1)
plot(h2, 'r')
hold off
axis([0 L2 -70 5]);
grid on;
