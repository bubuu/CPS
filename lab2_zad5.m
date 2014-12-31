%Malgorzata Targan
% 131420
% lab 2

clear all
close all

fp = 11025;

f1 = 400;
f2 = 800;
f3 = 1200;

wi = 2;

f_od = 1/2;

N = 225;
n = [0:N-1];
C = [2 4]

t = [0 : 1/fp : (N-1)/fp];

%sygna³ ci¹g³y z f1,f2,f3
y = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);

%wspó³czynik interpolacji = 2
%wstwiane jest '0' pomiêdzy ka¿d¹ parê
y_int = zeros(1,C(1)*N);
for i = 1 : length(y_int)
    if ( mod(i,C(1)) == 0 )
        y_int(i) = y(i/C(1));
    else
        y_int(i) = 0;
    end
end

[b,a] = cheby2(6,40,f_od);
y_lowpass = filter(b,a,y_int);

subplot(3,1,1);
plot(n,y);
xlabel('n'); 
ylabel('x[n]'); 
title('sygal oryginalny');
axis([0 225 -3 3]);

subplot(3,1,2);
plot(n,y_lowpass(1:225));
xlabel('n'); 
ylabel('x[n]'); 
title('sygal interpolowany, wspolczynnik = 2');
axis([0 225 -3 3]);

%wspó³czynik interpolacji = 4
y_int2 = zeros(1,C(2)*N);
for i = 1 : length(y_int2)
    if ( mod(i,C(2)) == 0 )
        y_int2(i) = y(i/C(2));
    else
        y_int2(i) = 0; 
    end
end

[b,a] = cheby2(6,40,f_od/2);
y_lowpass2 = filter(b,a,y_int2);

subplot(3,1,3);
plot(n,y_lowpass2(1:225));
xlabel('n'); 
ylabel('x[n]'); 
title('sygal interpolowany, wspolczynnik = 4');
axis([0 225 -3 3]);

n2 = 0:(C(1)*(N)-1);
n3 = 0:(C(2)*(N)-1);
X = abs(fft(y,N));
figure
subplot(3,1,1);
plot(n*fp/N, X./max(X));
ylabel('X'); 
xlabel('f[Hz]'); 
title('widmo sygalu oryginalnego');
axis([0 11000 0 1]);
subplot(3,1,2);
X = abs(fft(y_lowpass));
plot(n2*fp/(C(1)*N), X./max(X));
ylabel('X'); 
xlabel('f[Hz]'); 
title('widmo sygalu interpolowanego, wspolczynnik = 2');
axis([0 11000 0 1]);
subplot(3,1,3);
X = abs(fft(y_lowpass2));
plot(n3*fp/(C(2)*N), X./max(X));
ylabel('X'); 
xlabel('f[Hz]'); 
title('widmo sygalu interpolowanego, wspolczynnik = 4');
axis([0 11000 0 1]);



