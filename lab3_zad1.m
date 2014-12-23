% Malgorzata Targan
% 131420    
% laboratorium 3

clear all
close all

N = 10000;
A = [0.5 0.3 0.3];
B = [0.5 0.7 0.7];
C = [2 2 5];
D = [1 1 3];

%create distribution
f(1,:) = A(1)*randn(1,N) + B(1)*((randn(1,N))*sqrt(D(1)) + C(1));
f(2,:) = A(2)*randn(1,N) + B(2)*((randn(1,N))*sqrt(D(2)) + C(2));
f(3,:) = A(3)*randn(1,N) + B(3)*((randn(1,N))*sqrt(D(3)) + C(3));

mean(f(1,:))
mean(f(2,:))
mean(f(3,:))

sqrt(var(f(1,:)))
sqrt(var(f(2,:)))
sqrt(var(f(3,:)))

%show
figure
[temp, x] = hist(f(1,:), 50);
bar(x, temp/trapz(x,temp));
xlabel('x');
ylabel('p(x)');

title('Funkcja gestosci prawdopodobienstwa');
figure
[temp, x] = hist(f(2,:), 50);
bar(x, temp/trapz(x,temp));
xlabel('x');
ylabel('p(x)');
title('Funkcja gestosci prawdopodobienstwa');
figure
[temp, x] = hist(f(3,:), 50);
bar(x, temp/trapz(x,temp));
xlabel('x');
ylabel('p(x)');
title('Funkcja gestosci prawdopodobienstwa');

