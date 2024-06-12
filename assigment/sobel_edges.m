% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Convert RGB image to grayscale
gray_image = rgb2gray(I(:,:,1:3));

% Apply edge detection
edges = edge(gray_image, 'Sobel');

% Display the filtered image
imshow(edges);
title('Filtered Image');
