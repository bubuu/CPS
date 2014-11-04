% Malgorzata Targan KSE
% 131420
% zadanie 2 lab 1

clear all
close all

p = 10;
Mp = 1;
Mt = 1;
N = 2*p*99;

y(1,:) = zeros(1,N);
y(2,:) = zeros(1,N);

while(1)
    
    k = (Mp+1)/2;
    n = 1:N;
    
    %fala prostokatna
    y(1,:) = y(1,:) + (1/(2*k'-1))*sin(2*pi*p*(2*k'-1)*(n/N));  
    subplot(211);
    plot(n,y(1,:));
    xlabel('n');
    ylabel('y[n]');
    title('Sygnal prostok¹tny'); 
    
    
    k = Mt;
    %fala trojkatna
    y(2,:) = y(2,:) + (1/k')*sin((2*pi*p*k')*(n/N));
    subplot(212);
    plot(n,y(2,:));
    xlabel('n');
    ylabel('y[n]');
    title('Sygnal trojkatny');
    
    pause
    Mp = Mp+2;
    Mt = Mt+1;
      
end








