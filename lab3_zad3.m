% Malgorzata Targan
% 131420    
% laboratorium 3

clear all
close all

N = 5000
A = 4
B = 6
n = [1:N]


x = [-5:0.1:20]
%calculate distribution
f = sqrt(A)*randn(1,N) + B

%calculate theoretical distribution
fc = 1/sqrt(2*pi*A)*exp(-((x-B).^2)/(2*A))

%three-sigma range + 1
R = 3*sqrt(A);
range = B-R-1:1:B+R+1

[fb,x2] = hist(f, range)
% three-sigma range
ftr = fb(2:length(fb)-1);
xtr = x2(2:length(x2)-1);
plot(x, fc);
title('Gestosc prawdopodobienstwa')
xlabel('x');
ylabel('p(x)');

hold on
bar2(xtr, ftr/sum(fb), 'r');

% integral for three sigma range
integral = sum((ftr/sum(fb)))
