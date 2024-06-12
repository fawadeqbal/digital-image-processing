% Read the 4-channel map image
map = imread('./images/Group-1-3-5.tif');

% Extract the RGB channels (ignoring the alpha channel)
map_rgb = map(:, :, 1:3);

% Convert the RGB image to grayscale
map_gray = rgb2gray(map_rgb);

% Threshold the grayscale image to create a binary mask
threshold = 100; % Adjust this threshold value as needed
binary_mask = map_gray < threshold;

% Use morphological operations to clean up the mask
se = strel('rectangle', [5, 5]); % Adjust the size of the structuring element as needed
binary_mask_cleaned = imclose(binary_mask, se);
binary_mask_cleaned = imfill(binary_mask_cleaned, 'holes');

% Invert the mask to get the non-border region
non_border_mask = ~binary_mask_cleaned;

% Apply the mask to the RGB channels to remove the border
map_rgb_no_border = map_rgb;
for channel = 1:3
    map_rgb_no_border(:,:,channel) = map_rgb(:,:,channel) .* uint8(non_border_mask);
end

% Combine the RGB channels to form the image without the border
map_no_border = cat(3, map_rgb_no_border);

% Display the original and processed images
figure;
subplot(1, 2, 1);
imshow(map_rgb);
title('Original RGB Image');

subplot(1, 2, 2);
imshow(map_no_border);
title('Map Image with Border Removed');
