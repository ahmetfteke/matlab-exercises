function thresholdImage = MyThresholdF(Img, T)
%MyThresholdF is the function to treshold the image given in the first parameter 
%   The function takes two parameters first one is the original image, the
%   second one is the value of the treshold and it returns the tresholded
%   image
[rows,cols] = size(Img); 
thresholdImage = zeros(rows,cols); % an empty array to hold the thresholded values
for i = 1:rows
  for j = 1:cols
      if (Img(i,j) >= T)
          thresholdImage(i,j) = 0;
      else 
          thresholdImage(i,j) = 1;
      end   
  end
end


end

