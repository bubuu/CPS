clear all
close all


L = 200;
vcl = 0.04
vch = 0.4

hl = fir_lowpass_weights(2*L+1, vcl);
hh = fir_lowpass_weights(2*L+1, vch);

subplot(2,1,1);
plot(hl);
xlabel('n');
ylabel('h[n]');
xlim([0 2*L]);

subplot(2,1,2);
plot(hh);
xlabel('n');
ylabel('h[n]');
xlim([0 2*L]);

hlf = abs(fft(hl));
Hl = 20 * log10(hlf/hlf(1,1));

hhf = abs(fft(hh));
Hh = 20 * log10(hhf/hhf(1,1));

figure(2)
plot(Hl);
hold on;
plot(Hh, 'r');
axis([0 L -90 5]);
grid on;

