% problem 5: deconvolution microscopy 
%% part a 
figure (1)
imshow(image(:,:,20),[]) % shows the image 
title('original image')
figure (2)
subplot(4,1,1)
plot(psf(256,:,20))
title('line 256')
subplot(4,1,2)
plot(psf(270,:,20))
title('line 270')
subplot(4,1,3)
plot(psf(240,:,20))
title('line 240')
subplot(4,1,4)
plot(psf(260,:,20))
title('line 260')

%% new test
imshow(abs(psf(270,:,20)))
%% part b
fftimage=fftshift(fftn(ifftshift(image)));
fftPSF=fftshift(fftn(ifftshift(psf)));
B=max(max(max(abs(fftPSF))));
deconvolution=fftimage./abs(fftPSF+B);
imagedomain=fftshift(ifftn(ifftshift(deconvolution)));
figure (3)
subplot(2,1,1)
%plot(imagedomain(256,:,30))
imshow(imagedomain(:,:,20),[])
title('b. 3D deconvolution')
subplot(2,1,2)
%plot(reference(256,:,30))
imshow(reference(:,:,20),[])
title('b. reference deconvolution')

%% part c 
% A=0.1
A=0.1*max(max(max(abs(fftPSF))));
deconvolution2=fftimage./(abs(fftPSF)+A);
imagedeconvolution2=fftshift(ifftn(ifftshift(deconvolution2)));
figure (4)
subplot(3,1,1)
%plot(imagedeconvolution2(256,:,30))
imshow(imagedeconvolution2(:,:,20),[])
title('c. improved deconvolution A=.1')
% A=0.2
A=0.2*max(max(max(abs(fftPSF))));
deconvolution2=fftimage./(abs(fftPSF)+A);
imagedeconvolution2=fftshift(ifftn(ifftshift(deconvolution2)));
subplot(3,1,2)
%plot(imagedeconvolution2(256,:,30))
imshow(imagedeconvolution2(:,:,20),[])
title('c. improved deconvolution A=0.2')
% A=100
A=1*max(max(max(abs(fftPSF))));
deconvolution2=fftimage./(abs(fftPSF)+A);
imagedeconvolution2=fftshift(ifftn(ifftshift(deconvolution2)));
subplot(3,1,3)
%plot(imagedeconvolution2(256,:,30))
imshow(imagedeconvolution2(:,:,20),[])
title('c. improved deconvolution A=1')

%% extra credit 
% deconvolves image I using reularized filter algorithm, returning
% deblurred image J 
%J=deconvlucy(image,psf,20);
h=fspecial('gaussian');
J=deconvreg(image,h);
figure (5)
imshow(J(:,:,20),[])
title('extra credit') 