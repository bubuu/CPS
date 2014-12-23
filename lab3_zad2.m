% Malgorzata Targan
% 131420    
% laboratorium 3

clear all
close all

Udc = 3;
Urms = 2;

%select apropriate range
x = [-2:0.1:8];

%calculate 
f = 1/sqrt(2*pi*Urms)*exp(-((x-Udc).^2)/(2*Urms));

%show
plot(x,f);
title('Funkcja gestosci prawdopodobienstwa szumu')
ylabel('p(x)')
xlabel('x')

