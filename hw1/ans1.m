clc, clear all, close all;

%% (a) Use MATLAB to plot :
% angle value
x= linspace(0, 2*pi, 1000);
% real value of sin
y = sin(x);
% plot the results
plot(x,y,'-r', 'LineWidth',2);
xlabel('X Value');
ylabel('Y Value');

% •	The sum of the first 7 terms of the series,
y7 = func(x, 7);
hold on;
plot(x,y7,'--g', 'LineWidth',1)

% •	The sum of the first 8 terms of the series,
y8 = func(x, 8);
hold on;
plot(x,y8,'--b', 'LineWidth',1)
legend('Real Data Plot', 'sum of 7 term of series plot', 'sum of  8 term of Series plot' );

%% (b) Use MATLAB/OCTAVE to sum the first 7 terms of the series for x = 1.4 ?. What is the
% relative true error?
x0 = 1.4*pi;
y0 = sin(x0);
y0_7 = func(x0,7);
% absolute error
abs_err_dy =y0_7 - y0;
% relative true error?
Rela_true_error = abs_err_dy/abs(y0)*100;
fprintf('The relative true error is %f   \n', Rela_true_error/100);

%% (c) How many terms do you need to include in the sum for the relative true error to become less
% than 1%?
term = 0;
while 1
    term = term + 1;
     y0_7 = func(x0,term);
    % absolute error
    abs_err_dy =y0_7 - y0;
    % relative true error?
    Rela_true_error = abs_err_dy/abs(y0_7)*100;
    if Rela_true_error<1
        break;
    end
end

fprintf(' The terms do you need to include in the sum for the relative true error to become less than 1  is % d  \n', term);

%% (d) How many terms do you need to include in the sum for the relative approximation error 
% to become less than 1%?
term = 0;
while 1
    term = term + 1;
    ya =  func(x0,term+1);
    ya1 =  func(x0,term);
    % error
     abs_err_dy =ya- ya1;
    % 
    app_error = abs_err_dy/ya*100;
    if app_error<1
        break;
    end
end
fprintf(' The terms do you need to include in the sum for the relative approximation error to become less than 1  is % d  \n', term);





