
function p=quad_interp_spline(x,y)
  % this function calculate the value of the quadrature polynomials
  % that interpolate the data in each interval [x(i) x(i+1)] 
  % p is a matrixof size N time 3. N the number of intervals in the 
  % input vector x. each row correspond containe the coefficients of the
  % polynomial p_i that interpolate the intarval i.
  n=length(x);
  L=3*(n-1);
  b=zeros(L,1);
  %%% construction of the vector b;
  b(1)=y(1);
  b(2*(n-1))=y(end);
  ct=2;
  for i=2:2:2*(n-1)-1
      b(i)=y(ct);
      b(i+1)=y(ct);
      ct=ct+1;
  end
  %%% Constraction of the matrix A.
  A=zeros(L);
  A(1,1:3)=[x(1)^2 x(1) 1];
  A(2*(n-1),end-2:end)=[x(end)^2 x(end) 1];
  A(end,1)=1;
  ct1=2;
  ct2=1;
  for i=2:2:2*(n-1)-1
      v=[x(ct1)^2 x(ct1) 1];
      A(i,ct2:ct2+2)=v;
      ct2=ct2+3;
      A(i+1,ct2:ct2+2)=v;
      ct1=ct1+1;
  end
  ct1=2;
  ct2=1;
  for i=2*(n-1)+1:L-1
      v=[2*x(ct1) 1 0 -2*x(ct1) -1];
      A(i,ct2:ct2+4)=v;
      ct1=ct1+1;
      ct2=ct2+3;
  end
  %%% resolution of the system.
  p=A\b;
  p=reshape(p,3,n-1);
  p=p';
end