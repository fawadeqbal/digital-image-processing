% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the RGB channels (ignoring the alpha channel)
I_rgb = I(:, :, 1:3);

% Apply Gaussian filter to each RGB channel separately
filtered_gaussian_R = imgaussfilt(I_rgb(:,:,1), 2); % Gaussian filter on the red channel
filtered_gaussian_G = imgaussfilt(I_rgb(:,:,2), 2); % Gaussian filter on the green channel
filtered_gaussian_B = imgaussfilt(I_rgb(:,:,3), 2); % Gaussian filter on the blue channel

% Combine the filtered RGB channels
filtered_image_gaussian = cat(3, filtered_gaussian_R, filtered_gaussian_G, filtered_gaussian_B);

% Apply median filter to each RGB channel separately
filtered_median_R = medfilt2(I_rgb(:,:,1), [10, 10]); % Median filter on the red channel
filtered_median_G = medfilt2(I_rgb(:,:,2), [10, 10]); % Median filter on the green channel
filtered_median_B = medfilt2(I_rgb(:,:,3), [10, 10]); % Median filter on the blue channel

% Combine the filtered RGB channels
filtered_image_median = cat(3, filtered_median_R, filtered_median_G, filtered_median_B);

% Display the filtered images
figure;
subplot(1, 3, 1);
imshow(I_rgb);
title('Original RGB Image');

subplot(1, 3, 2);
imshow(filtered_image_gaussian);
title('Gaussian Filtered Image');

subplot(1, 3, 3);
imshow(filtered_image_median);
title('Median Filtered Image');
