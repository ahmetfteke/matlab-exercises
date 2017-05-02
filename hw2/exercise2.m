
clear all 
close all
clc

years=[1975 1980 1985 1990];
W_europe=[72.8 74.2 75.2 76.4];
E_europe=[70.2 70.2 70.3 71.2];

p1=lagrange_interp(years,W_europe);
p2=lagrange_interp(years,E_europe);

% Life expectation of the for the western europe in 1970 and 1983
val_W_1970=p_val(p1,1970);
val_W_1983=p_val(p1,1983);
% Life expectation of the for the eastern europe in 1970 and 1983
val_E_1970=p_val(p2,1970);
val_E_1983=p_val(p2,1983);

% regeression for the western europe data
pw=linear_regression(years,W_europe);
r_w=p_val(pw,years);

figure, plot(years,W_europe,'b', years,r_w,'r');
title('western europe'),legend('orignal curve','fitted curve');
axis([1975 1990 65 80]);

% regeression for the Eestern europe data
pe=linear_regression(years,E_europe);
r_e=p_val(pe,years);

figure, plot(years,E_europe,'b', years,r_e,'r');
title('eastern europe'),legend('orignal curve','fitted curve');
axis([1975 1990 65 80]);

%%% calculating errors
% for western europe case
N=length(years);
mn_w=mean(W_europe);
R_W=1-sum(abs(W_europe-r_w).^2)/sum(abs(W_europe-mn_w).^2);
MAE_W=sum(abs(W_europe-r_w))/N;
RMSE_W=sqrt(sum(abs(W_europe-r_w).^2)/N);
MAPE_W=100*sum(abs(W_europe-r_w)./abs(W_europe))/N;
disp("Calculating errors for western europe case");
disp ("Goodness of fit R^2: "), disp(R_W);
disp ("MAE: "), disp (MAE_W);
disp ("RMSE: "), disp (RMSE_W);
disp ("MAPE: "), disp (MAPE_W);

% for eastern europe case
mn_e=mean(E_europe);
R_E=1-sum(abs(E_europe-r_e).^2)/sum(abs(E_europe-mn_e).^2);
MAE_E=sum(abs(E_europe-r_e))/N;
RMSE_E=sqrt(sum(abs(E_europe-r_e).^2)/N);
MAPE_E=100*sum(abs(E_europe-r_e)./abs(E_europe))/N;
disp("Calculating errors for eastern europe case");
disp ("Goodness of fit R^2: "), disp(R_E);
disp ("MAE: "), disp (MAE_E);
disp ("RMSE: "), disp (RMSE_E);
disp ("MAPE: "), disp (MAPE_E);

%%% extrapolation for the year 1995
ex_w=p_val(pw,1995);% the case of western europe.
ex_e=p_val(pe,1995);% the case of eastern europe.
% our fit is for the range [1975 1990], and we want to extrapolate the
% value of 1995. 1970 is also spaced by 5 years to the fitted interval
% then corresponding value at 1970 can be used to estimate the accuracy 
% of the values extrapolated at 1995.
disp ("Extrapolation for the year 1995");
disp ("The case of western europe: "), disp(ex_w);
disp ("The case of eastern europe: "), disp(ex_e);

