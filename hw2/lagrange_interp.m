
function p=lagrange_interp(x,y)
  N=length(y);
  p=0;
  for ind1=1:N
      tmp=1;
      for ind2=1:N
          if(ind2~=ind1)
              tmp=conv(tmp,[1 -x(ind2)]/(x(ind1)-x(ind2)));
          end
      end
      p=p+tmp*y(ind1);
  end
end