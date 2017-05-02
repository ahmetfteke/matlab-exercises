
function y=p_val(p,x)
  N=length(p);
  y=zeros(size(x));
  for ind=1:N
      y=y+p(ind)*x.^(N-ind);
  end   
end

