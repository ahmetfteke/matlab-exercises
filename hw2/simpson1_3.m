
function I=simpson1_3(f,a,b,h)
  % f is the function to be integrated
  % fist value of the interval
  % 2nd value of the interval
  % h is the step size
  x=a:h:b;
  n=(b-a)/h;
  y=f(x);
  I=((b-a)/(3*n))*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-2))+y(end));
end