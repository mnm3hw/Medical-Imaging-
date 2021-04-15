% a. read in the input image 
im1 = imread('image1.png'); % load microscopy image
im1 = rgb2gray(im1); % select the grayscale part of the image
subplot(1,4,1)
imshow(im1, []); % display the image
title('Input Image')

% b. define the horizontal and vertical Sobel convolution kernels
% aka the impulse responses of 2 LSI systems 
h_horizontal = [-1 -2 -1; 0 0 0; 1 2 1]; % horizontal Sobel operator
h_vertical = [-1 0 1; -2 0 2; -1 0 1]; % vertical Sobel operator

% c. convolve the input image with the horizontal and vertical operators
% separately 
horiz=conv2(im1,h_horizontal);
vert=conv2(im1,h_vertical);
subplot(1,4,2)
imshow(horiz, [])
title('Convolution with horizontal Sobel operator')
subplot(1,4,3)
imshow(vert, [])
title('Convolution with vertical Sobel operator')

% d. compute the final image 
output = sqrt(horiz.^2 + vert.^2);
subplot(1,4,4)
imshow(output, [])
title('Output Image')

