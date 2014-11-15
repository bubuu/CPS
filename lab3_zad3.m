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
%create distribution
f = sqrt(A)*randn(1,N) + B

%calculate theoretical distribution
fc = 1/sqrt(2*pi*A)*exp(-((x-B).^2)/(2*A))

[fb,x2] = hist(f, 15)
plot(x, fc);
hold on
x2
bar2(x2, fb/sum(fb), 'r')
%bar2(x, f);
