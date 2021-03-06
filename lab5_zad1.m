% Malgorzata Targan
% 131420   
% laboratorium 5

clear all
close all

L = 200;
vcl = 0.04
vch = 0.4

hl = fir_lowpass_weights(2*L+1, vcl);
hh = fir_lowpass_weights(2*L+1, vch);

subplot(2,1,1);
plot(hl);
title('Odpowiedz impulsowa filtru dla v_c = 0.04');
xlabel('k');
ylabel('weight h_k');
xlim([0 2*L+1]);

subplot(2,1,2);
plot(hh);
title('Odpowiedz impulsowa filtru dla v_c = 0.4');
xlabel('k');
ylabel('weight h_k');
xlim([0 2*L+1]);

hlf = abs(fft(hl));
Hl = 20 * log10(hlf/hlf(1,1));

hhf = abs(fft(hh));
Hh = 20 * log10(hhf/hhf(1,1));

figure(2)
plot(((1:length(Hl))-1)/length(Hl), Hl);
title('Wzmocnienie filtru');
hold on;
plot(((1:length(Hh))-1)/length(Hh), Hh, 'r');
axis([0 0.5 -90 5]);
xlabel('\nu [Hz-s]');
ylabel('A[dB]');
legend('v_c = 0.04', 'v_c = 0.4')
grid on;

