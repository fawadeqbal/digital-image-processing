% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract each channel
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
ch4 = I(:,:,4);

% Apply histogram equalization to each channel
ch1_eq = histeq(ch1);
ch2_eq = histeq(ch2);
ch3_eq = histeq(ch3);

% Create color images for each equalized channel
redChannel_eq = cat(3, ch1_eq, zeros(size(ch1_eq)), zeros(size(ch1_eq)));
greenChannel_eq = cat(3, zeros(size(ch2_eq)), ch2_eq, zeros(size(ch2_eq)));
blueChannel_eq = cat(3, zeros(size(ch3_eq)), zeros(size(ch3_eq)), ch3_eq);

% Display histograms before equalization
figure;
subplot(3,2,1);
imhist(ch1);
title('Histogram of Channel R');

subplot(3,2,2);
imhist(ch1_eq);
title('Equalized Histogram of Channel R');

subplot(3,2,3);
imhist(ch2);
title('Histogram of Channel G');

subplot(3,2,4);
imhist(ch2_eq);
title('Equalized Histogram of Channel G');

subplot(3,2,5);
imhist(ch3);
title('Histogram of Channel B');

subplot(3,2,6);
imhist(ch3_eq);
title('Equalized Histogram of Channel B');

% Display each equalized channel in its respective color
figure;
subplot(2,2,1);
imshow(ch1);
title('Channel R (Original)');

subplot(2,2,2);
imshow(ch2);
title('Channel G (Original)');

subplot(2,2,3);
imshow(ch3);
title('Channel B (Original)');

subplot(2,2,4);
imshow(ch4, []);
title('Channel 4');

figure;
subplot(2,2,1);
imshow(redChannel_eq);
title('Channel R (Equalized)');

subplot(2,2,2);
imshow(greenChannel_eq);
title('Channel G (Equalized)');

subplot(2,2,3);
imshow(blueChannel_eq);
title('Channel B (Equalized)');

subplot(2,2,4);
imshow(ch4, []);
title('Channel 4');

% Combine the first three equalized channels into an RGB image
combinedI_eq = cat(3, ch1_eq, ch2_eq, ch3_eq);
figure;
title("original image")
imhist(im2gray(cat(3,ch1,ch2,ch3)));
% Display the combined equalized image in a separate figure
figure;
imshow(combinedI_eq);
title('Combined Image (Equalized Channels R, G, B)');