% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract each channel
ch1 = I(:,:,1); % Red
ch2 = I(:,:,2); % Green
ch3 = I(:,:,3); % Blue
ch4 = I(:,:,4);

% Create color images for each channel
redChannel = cat(3, ch1, zeros(size(ch1)), zeros(size(ch1)));
greenChannel = cat(3, zeros(size(ch2)), ch2, zeros(size(ch2)));
blueChannel = cat(3, zeros(size(ch3)), zeros(size(ch3)), ch3);

% Display each channel in its respective color
figure;
subplot(2,2,1);
imshow(redChannel);
title('Channel R');

subplot(2,2,2);
imshow(greenChannel);
title('Channel G');

subplot(2,2,3);
imshow(blueChannel);
title('Channel B');

subplot(2,2,4);
imshow(ch4, []);
title('Channel 4');

% Combine the first three channels into an RGB image
combinedI = cat(3, ch1, ch2, ch3);

% Display the combined image in a separate figure
figure;
imshow(combinedI);
title('Combined Image (Channels R, G, B)');
