% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the first three channels (RGB channels)
I_rgb = I(:, :, 1:3);

% Specify the desired output size (e.g., half the original size)
output_size = [size(I_rgb, 1)/10, size(I_rgb, 2)/10];

% Resize each RGB channel separately
I_resized_rgb = cat(3, imresize(I_rgb(:,:,1), output_size),imresize(I_rgb(:,:,2), output_size),imresize(I_rgb(:,:,3), output_size));

% Display the resized image
figure;
subplot(1,2,1);
imshow(I_resized_rgb);
title('Resized Image');
subplot(1,2,2);
imshow(I_rgb);
