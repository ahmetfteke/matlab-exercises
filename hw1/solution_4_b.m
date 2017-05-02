clc;close all;clear all

for x=-2:0.01:8
y=4.5282+1.9855*x-0.3248*x^2;
plot(x,y,'r'); 
hold on
end
grid on
title('plot of y=4.5282+1.9855x-0.3248x^2');
xlabel('x');
ylabel('y');