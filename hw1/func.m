function val = func(x, iter)
val = 0;
for i=1:iter
    a = i*2-1;
    if mod(i,2)
        val =val +  x.^a./factorial(a);
    else
        val =val -  x.^a./factorial(a);
    end
    % x-x.^3/3+x.^5/5-x.^7/7+
end