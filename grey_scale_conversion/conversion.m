clc;
clear;
close all;

x = imread("yellowlily.jpg");
subplot(2,1,1);
imshow(x);
title("Original Image");

y=rgb2gray(x);
subplot(2,1,2);
imshow(y);
title("Grey Scale Image");