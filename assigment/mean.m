% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels to form an RGB image
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
I_rgb = cat(3, ch1, ch2, ch3);

% Apply mean filter to each channel
filter_size = [3, 3]; % Size of the mean filter, adjust as needed
ch1_mean = imfilter(ch1, fspecial('average', filter_size), 'replicate');
ch2_mean = imfilter(ch2, fspecial('average', filter_size), 'replicate');
ch3_mean = imfilter(ch3, fspecial('average', filter_size), 'replicate');

% Combine the mean filtered channels to form the filtered RGB image
I_rgb_mean = cat(3, ch1_mean, ch2_mean, ch3_mean);

% Display the original and filtered mean images
figure;
imshow(I_rgb);
title('Original RGB Image');

figure;
imshow(I_rgb_mean);
title('Filtered Mean RGB Image');
