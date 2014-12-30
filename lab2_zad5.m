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



t = [0 : 1/fp : (N-1)/fp];


%sygna³ ci¹g³y z f1,f2,f3
y = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);



%wspó³czynik interpolacji = 2
%wstwiane jest '0' pomiêdzy ka¿d¹ parê
y_int = zeros(1,2*N-1);
for i = 1 : N
    if ( mod(i,2) == 1 )
        y_int(i) = y(i);
    else
        y_int(i) = 0;
    end
end

[b,a] = cheby2(6,40,f_od);
y_lowpass = filter(b,a,y_int);



plot(n,y);

figure
plot(n,y_lowpass(1:225));




y_int2 = zeros(1,4*N-1);
for i = 1 : N
    if ( mod(i,4) == 1 )
        y_int2(i) = y(i);
    else
        y_int2(i) = 0; 
    end
end

[b,a] = cheby2(6,40,f_od);
y_lowpass2 = filter(b,a,y_int2);


figure
plot(n,y_lowpass2(1:225));

figure
plot(abs(fft(y,N)));
figure
plot(abs(fft(y_lowpass,2*N)));
figure
plot(abs(fft(y_lowpass2,4*N)));




