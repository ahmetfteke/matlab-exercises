
function p=linear_regression(x,y)
  % linear_regresssion is a function that fits the data by a straight
  % line by using least square regression.
  % the equation of the line is a1*x+a0
  % x and y are two n_dimentional vectors.
  % p contain the coefficients of the line that best fit the data.
  % p(1) is the slop and p(2) is the intercept.
  n=length(x);% number of points
  sx=sum(x);
  sy=sum(y);
  sxx=sum(x.*x);
  sxy=sum(x.*y);
  
  A=[n sx;sx sxx];
  b=[sy;sxy];
  r=A\b;
  p=[r(2); r(1)];
end