% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels to form an RGB image
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
I_rgb = cat(3, ch1, ch2, ch3);

% Apply low-pass filter to each channel
sigma_lp = 5;% Standard deviation for low-pass filter, adjust as needed
ch1_lp = imgaussfilt(ch1, sigma_lp);
ch2_lp = imgaussfilt(ch2, sigma_lp);
ch3_lp = imgaussfilt(ch3, sigma_lp);

% Combine the low-pass filtered channels to form the filtered RGB image
I_rgb_lp = cat(3, ch1_lp, ch2_lp, ch3_lp);

% Display the original and filtered low-pass images
figure;
imshow(I_rgb);
title('Original RGB Image');

figure;
imshow(I_rgb_lp);
title('Filtered Low-Pass RGB Image');
