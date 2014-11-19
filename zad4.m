% Malgorzata Targan KSE
% 131420
% zadanie 4 lab 1

clear all
close all

M = 3;
T = 1;

f1 = [1,3,2];
f2 = [1,3,4,2];
f3 = [1.1,2.5,3.2,3.8,3.7,3.1,2.0];
f4 = [8,6,4,2.5,1,0,-0.5,-0.5,0,1.5,2.5,4,5,7,8];

N(1,1) = length(f1);
N(1,2) = length(f2);
N(1,3) = length(f3);
N(1,4) = length(f4);

m = 0:M-1; 

n = 0:(N(1,1)-1);  
G = [n'.^m(1), n'.^m(2), n'.^m(3)];
a=(G'*G)\(f1*G)'; 
arg = [0:(N(1,1)/1000):N(1,1)-1];
fhat=[arg'.^m(1),arg'.^m(2),arg'.^m(3)]*a; 
plot(0:N(1,1)-1,f1,'o',arg,fhat); 
xlabel('n');
ylabel('x[n]');
title('Aproksymacja sygna³u x[n] dla f1');
grid;

figure
n = 0:(N(1,2)-1);  
G = [n'.^m(1), n'.^m(2), n'.^m(3)];
a=(G'*G)\(f2*G)'; 
arg = [0:(N(1,2)/1000):N(1,2)-1];
fhat=[arg'.^m(1),arg'.^m(2),arg'.^m(3)]*a; 
plot(0:N(1,2)-1,f2,'o',arg,fhat); 
xlabel('n');
ylabel('x[n]');
title('Aproksymacja sygna³u x[n] dla f2');
grid;

figure
n = 0:(N(1,3)-1);  
G = [n'.^m(1), n'.^m(2), n'.^m(3)];
a=(G'*G)\(f3*G)'; 
arg = [0:(N(1,3)/1000):N(1,3)-1];
fhat=[arg'.^m(1),arg'.^m(2),arg'.^m(3)]*a; 
plot(0:N(1,3)-1,f3,'o',arg,fhat); 
xlabel('n');
ylabel('x[n]');
title('Aproksymacja sygna³u x[n] dla f3');
grid;

figure
n = 0:(N(1,4)-1);  
G = [n'.^m(1), n'.^m(2), n'.^m(3)];
a=(G'*G)\(f4*G)'; 
arg = [0:(N(1,4)/1000):N(1,4)-1];
fhat=[arg'.^m(1),arg'.^m(2),arg'.^m(3)]*a; 
plot(0:N(1,4)-1,f4,'o',arg,fhat); 
xlabel('n');
ylabel('x[n]');
title('Aproksymacja sygna³u x[n] dla f4');
grid;