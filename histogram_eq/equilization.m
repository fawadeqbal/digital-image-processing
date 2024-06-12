close all;
clear all;
clc;


I = imread("tire.tif");
subplot(1,2,1);
imshow(I)

subplot(1,2,2)
imhist(I);

figure;

I2=histeq(I);
subplot(1,2,1);
imshow(I2)

subplot(1,2,2)
imhist(I2);
