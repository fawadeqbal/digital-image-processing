% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract each channel
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
ch4 = I(:,:,4);

% Define the Laplacian filter
laplacianFilter = fspecial('laplacian', 0);
combined_I=cat(3,ch1,ch2,ch3);
grey=im2gray(combined_I);
% Apply the Laplacian filter to each channel
I_lap = imfilter(grey, laplacianFilter, 'replicate');
figure;
imshow(grey);

% Display the combined filtered image in a separate figure
figure;
imshow(I_lap, []);
title('Combined Image (Laplacian Channels R, G, B)');
