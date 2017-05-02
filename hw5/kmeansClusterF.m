function Tnew = kmeansClusterF( I )
T = 0.5;
ThreshImg = MyThresholdF(I, T); % threshold the image with the value of 0.5
figure, imshow(ThreshImg), title('Thresholded image with a random value of 0.5');
[rows,cols] = size(ThreshImg);
% counters for the R_f, R_b arrays
R_f = zeros(1, 2);
R_b = zeros(1, 2);
f = 1;
b = 1;
% initialize R_b and R_f, they hold the pixel coordinates (x,y) for the
% foreground and the background regions
for i = 1:rows
  for j = 1:cols
      if (ThreshImg(i,j) == 1) % if the pixel on the coordinates (i,j) is equal to 1 then it belongs to the foreground 
         R_f(f,:) = [i,j];
         f = f + 1;
      end
      if (ThreshImg(i,j) == 0)  % if the pixel on the coordinates (i,j) is equal to 0 then it belongs to the background 
         R_b(b,:) = [i,j];
         b = b + 1;
      end
  end
end
Told = 0;
Tnew = T;
while (Told ~= Tnew)
    % gets the mean greylevel in foreground region
    Told = Tnew;
    sumF = 0;
    sizes = size (R_f);
    sizeF = sizes(1);
    for f=1:sizeF
        x = R_f(f,1);
        y = R_f(f,2);
        sumF = sumF + I (x,y);
    end
    meanF = sumF / sizeF;
    % Gets the mean greylevel in baxkground region
    sumB = 0;
    sizes = size (R_b);
    sizeB = sizes(1);
    for b=1:sizeB
        x = R_b(b,1);
        y = R_b(b,2);
        sumB = sumB + I (x,y);
    end
    meanB = sumB / sizeB;
    Tnew = (meanB + meanF) / 2;
    NewThreshImg = MyThresholdF(I, Tnew);
    % Find new regions, assign new values to the R_b and R_f arrays
    R_f = zeros(1, 2);
    R_b = zeros(1, 2);
    f = 1;
    b = 1;
    for i = 1:rows
        for j = 1:cols
            if (NewThreshImg(i,j) == 1) % if the pixel on the coordinates (i,j) is equal to 1 then it belongs to the foreground 
                R_f(f,:) = [i,j];
                f = f + 1;
            end
            if (NewThreshImg(i,j) == 0)  % if the pixel on the coordinates (i,j) is equal to 0 then it belongs to the background 
                R_b(b,:) = [i,j];
                b = b + 1;
            end
        end
    end
end
size(R_f)
size(R_b)
end

