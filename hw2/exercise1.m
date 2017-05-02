
clear all
close all
clc

T=[4 8 12 16 20];% values(in degrees Celsius)
rho=[1000.7794 1000.6427 1000.2805 999.7165 998.9700];% values of density (in Kg/m3)
p=quad_interp_spline(T,rho);% perform the quadratic interpolation spline.

h=0.1;% step size for plotting the data
I1=T(1):h:T(2);% fisrt interval [4 8]
I2=T(2):h:T(3);% second interval [8 12]
I3=T(3):h:T(4);% third interval [12 16]
I4=T(4):h:T(5);% fourth interval [16 20]

% calculating the corresponding result for the various intervals
R1=p_val(p(1,:),I1);
R2=p_val(p(2,:),I2);
R3=p_val(p(3,:),I3);
R4=p_val(p(4,:),I4);
% plotting the results
figure, plot(I1,R1),xlabel('T'), ylabel('rho'), title('[4 8]');
figure, plot(I2,R2),xlabel('T'), ylabel('rho'), title('[8 12]');
figure, plot(I3,R3),xlabel('T'), ylabel('rho'), title('[12 16]');
figure, plot(I4,R4),xlabel('T'), ylabel('rho'), title('[16 20]');

% true value of T=6, 10, 14, and 18
rho_T6=1000.74082;
rho_T10=1000.4882;
rho_T14=1000.0224;
rho_T18=999.3650;
% calculating the relative errors for the value of T;
D_6=(abs(rho_T6-p_val(p(1,:),6))/rho_T6)*100
D_10=(abs(rho_T10-p_val(p(2,:),10))/rho_T10)*100
D_14=(abs(rho_T14-p_val(p(3,:),14))/rho_T14)*100
D_18=(abs(rho_T18-p_val(p(4,:),18))/rho_T18)*100

% from the value of D_6,...,D_18 the relative errors is about 0.003%   
% then the interpolation of the data is precise.

