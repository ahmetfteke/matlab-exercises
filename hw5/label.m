function L = label (x_strt, y_strt, n, B, L)
% Recursively give label n to this pixel and all its foreground neighbours.
[ROWS COLS] = size(B);

L(x_strt, y_strt) = n;
%x_strt
%y_strt
%L
N = zeros(1,2);
% 9 if statements are implemented for various locations of the image, the
% N matrix holds the coordinates of the pixels to be checked for
% labelling

% if the pixel is on the left top corner
    if (x_strt == 1 && y_strt == 1) 
    N (1, :) = [x_strt, y_strt + 1];
    N (2, :) = [x_strt + 1, y_strt];
    N (3, :) = [x_strt + 1, y_strt + 1];
% if the pixel is on the right top corner of the image
else if (x_strt == 1 && y_strt == COLS)
    N (1, :) = [x_strt, y_strt];
    N (2, :) = [x_strt + 1, y_strt];
    N (3, :) = [x_strt + 1, y_strt - 1];
% if the pixel is on the left bottom corner
else if (x_strt == ROWS && y_strt == 1)
    N (1, :) = [x_strt - 1, y_strt];
    N (2, :) = [x_strt - 1, y_strt + 1];
    N (3, :) = [x_strt, y_strt + 1];
% if the pixel is on the right bottom corner of the image
else if (x_strt == ROWS && y_strt == COLS)
    N (1, :) = [x_strt - 1, y_strt];
    N (2, :) = [x_strt - 1, y_strt - 1];
    N (3, :) = [x_strt, y_strt - 1];

% if the pixel is on the top side of the image
else if (x_strt == 1) 
    N (1, :) = [x_strt + 1, y_strt];
    N (2, :) = [x_strt, y_strt - 1];
    N (3, :) = [x_strt, y_strt + 1];
    N (4, :) = [x_strt + 1, y_strt - 1];
    N (5, :) = [x_strt + 1, y_strt + 1];
% if the pixels are on the left side of the image    
else if (y_strt == 1)
    N (1, :) = [x_strt + 1, y_strt];
    N (2, :) = [x_strt - 1, y_strt];
    N (3, :) = [x_strt, y_strt + 1];
    N (4, :) = [x_strt - 1, y_strt + 1];
    N (5, :) = [x_strt + 1, y_strt + 1];
% if the pixel is on the bottom side of the image
else if (x_strt == ROWS)
    N (1, :) = [x_strt - 1, y_strt];
    N (2, :) = [x_strt, y_strt - 1];
    N (3, :) = [x_strt, y_strt + 1];
    N (4, :) = [x_strt - 1, y_strt - 1];
    N (5, :) = [x_strt - 1, y_strt + 1];
% if the pixels are on the right side of the image
else if (y_strt == COLS)
    N (1, :) = [x_strt + 1, y_strt];
    N (2, :) = [x_strt - 1, y_strt];
    N (3, :) = [x_strt, y_strt - 1];
    N (4, :) = [x_strt - 1, y_strt - 1];
    N (5, :) = [x_strt + 1, y_strt - 1];
% if the pixel is not on the sides nor corners
    else
        N (1, :) = [x_strt + 1, y_strt];
        N (2, :) = [x_strt + 1, y_strt - 1];
        N (3, :) = [x_strt + 1, y_strt + 1];
        N (4, :) = [x_strt - 1, y_strt];
        N (5, :) = [x_strt - 1, y_strt - 1];
        N (6, :) = [x_strt - 1, y_strt + 1];
        N (7, :) = [x_strt, y_strt - 1];
        N (8, :) = [x_strt, y_strt + 1];
    end
    end
    end
    end
    end
    end
    end
    end

sizesN = size(N);
sizeN = sizesN(1);

for i=1:sizeN
    x = N(i, 1);
    y = N(i, 2);
    if(L(x,y)== 0 && B(x,y)==1)
        L = label(x,y,n,B,L);
    end
end

end 