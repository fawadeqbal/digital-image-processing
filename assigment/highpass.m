% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels to form an RGB image
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
I_rgb = cat(3, ch1, ch2, ch3);

% Apply low-pass filter to each channel
sigma_lp = 100; % Standard deviation for low-pass filter, adjust as needed
ch1_lp = imgaussfilt(ch1, sigma_lp);
ch2_lp = imgaussfilt(ch2, sigma_lp);
ch3_lp = imgaussfilt(ch3, sigma_lp);

% Apply high-pass filter to each channel
ch1_hp = double(ch1) - double(ch1_lp);
ch2_hp = double(ch2) - double(ch2_lp);
ch3_hp = double(ch3) - double(ch3_lp);

% Combine the high-pass filtered channels to form the filtered RGB image
I_rgb_hp = cat(3, uint8(ch1_hp), uint8(ch2_hp), uint8(ch3_hp));

% Apply unsharp mask filter
amount = 2; % Sharpening amount
I_rgb_sharpened = double(I_rgb) + amount * double(I_rgb_hp);
I_rgb_sharpened = uint8(I_rgb_sharpened); % Ensure the image is in the uint8 format

% Display the original, high-pass filtered, and sharpened images
figure;
imshow(I_rgb);
title('Original RGB Image');

figure;
imshow(I_rgb_hp);
title('Filtered High-Pass RGB Image');

figure;
imshow(I_rgb_sharpened);
title('Sharpened RGB Image');
