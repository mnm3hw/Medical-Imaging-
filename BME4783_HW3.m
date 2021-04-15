%% CT spine image
figure (1)
subplot(2,2,1)
spineCT=imread('spineCT3.jpeg');
imshow(spineCT)
title("Original Image")
subplot(2,2,2)
imhist(spineCT)
title("Histogram of Image")
subplot(2,2,3)
histeq(spineCT);
title("Histogram Equalized")
subplot(2,2,4)
imhist(histeq(spineCT))
title("Histogram of Equalized")
%% CT brain image
figure (2)
subplot(2,2,1)
brainCT=imread('CThead.jpg');
imshow(brainCT)
title("Original Image")
subplot(2,2,2)
imhist(brainCT)
title("Histogram of Image")
subplot(2,2,3)
histeq(brainCT);
title("Histogram Equalized")
subplot(2,2,4)
imhist(histeq(brainCT))
title("Histogram of Equalized")

%% CT knee image 
figure (3)
subplot(2,2,1)
kneeCT=imread('kneeCT3.jpg');
imshow(kneeCT)
title("Original Image")
subplot(2,2,2)
imhist(kneeCT)
title("Histogram of Image")
subplot(2,2,3)
histeq(kneeCT);
title("Histogram Equalized")
subplot(2,2,4)
imhist(histeq(kneeCT))
title("Histogram of Equalized")
