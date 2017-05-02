% B is the binary image input. L is the labelled image output
function n = ConnectedComponents(B)
[X, Y] = size(B);
L = zeros(X, Y);
n = 1;
for i=1:X
    for j=1:Y
        if (B(i,j) == 1 && L(i,j) == 0)
            L = label(i,j,n,B,L);
            n = n + 1;
        end
    end
end




