I = imread("ngc6543a.jpg");
image(I);

imwrite(I,'clown.png','BitDepth',16);

load clown

imwrite(X,map,'clown.bmp');

image(X);

imfinfo('clown.png')
