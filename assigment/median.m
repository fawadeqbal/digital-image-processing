% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels to form an RGB image
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
I_rgb = cat(3, ch1, ch2, ch3);

% Apply median filter to each channel
filter_size = [8, 8]; % Size of the median filter, adjust as needed
ch1_median = medfilt2(ch1, filter_size);
ch2_median = medfilt2(ch2, filter_size);
ch3_median = medfilt2(ch3, filter_size);

% Combine the median filtered channels to form the filtered RGB image
I_rgb_median = cat(3, ch1_median, ch2_median, ch3_median);

% Display the original and filtered median images with black portions removed
figure;
subplot(1, 2, 1);
imshow(I_rgb);
title('Original RGB Image');

subplot(1, 2, 2);
imshow(I_rgb_median);
title('Filtered Median RGB Image with Black Portions Removed');
