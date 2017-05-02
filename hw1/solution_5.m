clc;close all;clear all
x0=1;
 epcilon0=input('epcilon0=');
for i=1:3
     figure, 
    x=-1:0.01:2;
    y=x.*cos(x)-sin(x);
     plot(x,y);
    fx=x0*cos(x0)-sin(x0);
    fx_dif=-x0*sin(x0)-cos(x0);
    x1=x0-fx/fx_dif;
    epcilon=abs((x1-x0)/x1);
    if epcilon<epcilon0
        break;
    end
     hold on
    y0=-2:0.01:0.5;
     plot(x0,y0,'g');
     plot(x1,y0,'r');
     title('the root of f(x) = x*cos(x)-sin(x)');
xlabel('x');
ylabel('f(x)');

     hold off
    disp(x1);
    x0=x1;
end