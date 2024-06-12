% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels to form an RGB image
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
I_rgb = cat(3, ch1, ch2, ch3);

% Apply Gaussian filter to each channel
sigma = 5; % Standard deviation for Gaussian filter, adjust as needed
ch1_filtered = imgaussfilt(ch1, sigma);
ch2_filtered = imgaussfilt(ch2, sigma);
ch3_filtered = imgaussfilt(ch3, sigma);

% Combine the filtered channels to form the filtered RGB image
I_rgb_filtered = cat(3, ch1_filtered, ch2_filtered, ch3_filtered);

% Display the original and filtered images
figure;
imshow(I_rgb);
title('Original RGB Image');

figure;
imshow(I_rgb_filtered);
title('Filtered RGB Image with Gaussian Filter');
