
clear all 
close all
clc

f=@(x) 1./(1+x.^2);

% for h=1
I1_1=trapez(f,0,4,1);
I2_1=simpson1_3(f,0,4,1);
% for h=0.5
I1_05=trapez(f,0,4,0.1);
I2_05=simpson1_3(f,0,4,0.1);

% calculating the true value
syms z
g=1/(1+z^2);
I_true=double(int(g,0,4))
%%% calculating the errors

Etrap_1=abs(I_true-I1_1);
Etrap_05=abs(I_true-I1_05);
Esimp_1=abs(I_true-I2_1);
Esimp_05=abs(I_true-I2_05);
