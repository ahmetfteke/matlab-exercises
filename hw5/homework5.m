I = imread('bird 3.bmp');
I = rgb2gray(I);
I = im2double(I);
T = kmeansClusterF(I); % gets the ideal threshold value using kmeansClusterF function
TImg = MyThresholdF(I, T);
figure, imshow(TImg), title('Binary Image');
number = ConnectedComponents(TImg) % gets the number of connected components in the img in this case birds

