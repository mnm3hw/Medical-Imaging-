load fse_t1_ax_data.mat 
% original image, d (raw data)
% command window filterDesigner
subplot(1,2,1)
imshow(abs(log(d)),[])
title('original image') 

% a)
subplot(1,2,2)
newD=ifft2c(d);
imshow(abs(newD),[])
title('a) magnitude of reconstructed image')

% b)
figure (2)
subplot(4,1,1)
dhalf=zeros(size(d));
dhalf(:,1:2:end)=d(:,1:2:end);
newD2=ifft2c(dhalf);
imshow(abs(newD2),[])
title('b) half of original data')

% c)
mycutoff = 320; % Empirically set this to a number less than 750.
D = designfilt('lowpassfir', 'FilterOrder', 32, 'CutoffFrequency',mycutoff, 'SampleRate', 1500);
dfilt = zeros(size(d));
for n = 1:size(d,1)
    dfilt(n,:) = filter(D, d(n,:));
end

subplot(4,1,2)
newD3=ifft2c(dfilt);
imshow(abs(newD3),[])
title('c) cutoff frequency=350')

% d)
subplot(4,1,3)
dhalf2=zeros(size(dfilt));
dhalf2(:,1:2:end)=dfilt(:,1:2:end);
newD3=ifft2c(dhalf2);
imshow(abs(newD3),[])
title('d) subsample of filtered raw data')

% e)
subplot(4,1,4)
dfiltrect = zeros(256,128);
dfiltrect(:, 1:128) = dhalf2(:, 1:2:end);
newD4=ifft2c(dfiltrect);
imshow(abs(newD4),[])
title('e) rectangular image')


