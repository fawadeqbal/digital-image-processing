close all;
clear;
clc;

I = imread('circuit.tif');

I2 = imcrop(I,[70 60 120 110]);

subplot(1,2,1);
imshow(I);

subplot(1,2,2);
imshow(I2);

figure;
I4=imcrop(I,[84.5 81.5 112 79])
