% Read the 4-channel image
I = imread('./images/Group-1-3-5.tif');

% Extract the RGB channels (ignoring the alpha channel)
I_rgb = I(:, :, 1:3);
I_grey=im2gray(I_rgb);
% Specify the rotation angle (e.g., 45 degrees clockwise)
angle = 45;

% Rotate each RGB channel separately
rotated= imrotate(I_grey, angle, 'bilinear', 'crop');

% Display the rotated image
imshow(rotated);
title('Rotated Image');
