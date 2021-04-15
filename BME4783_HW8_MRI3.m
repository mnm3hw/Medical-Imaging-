% MRI Homework 3

%% part 1, a
OGimage=zeros(257,257);

for b=1:257
    for c=1:257
        if (b-128.5)^2 + (c-128.5)^2 <80^2
            OGimage(b,c)=1;
        end 
    end 
end 
OGimage=complex(OGimage);
figure (1) 
subplot(1,2,1)
imshow(OGimage)
title('Original Image 257x257')

%% part 1, b
kspace_image=fftshift(fft2(OGimage));
subplot(1,2,2)
imshow(log(abs(kspace_image)),[])
title('k-space of original image')

%% part 1, c
% make the top 128 rows of k-space=0
for n=1:1:128
    kspace_image(n,:)=0;
end 

%kspace_image_recovered=conj(kspace_image);
% row loop, column loop
% point by point put the conjgate into a matrix
kspace_image_recovered=kspace_image;
for k=1:128
    for d=1:257
        kspace_image_recovered(k,d)=conj(kspace_image(258-k,258-d));
    end
end
symmetry=kspace_image+kspace_image_recovered;
check=kspace_image_recovered-kspace_image;
figure (2)
subplot(1,2,1)
imshow(log(abs(kspace_image_recovered)),[])
title('recovered conjugate symmetry image k-space')

% part 1,d
recovered=ifft2(fftshift(kspace_image_recovered));
subplot(1,2,2)
imshow(abs(recovered),[])
title('recovered image')

%% part 2, a
%image=zeros(257,257);

%newImage=OGimage*1*exp(-1i*pi*r/80);
% as the over scan lines increase, the image will look better because we
% use less and less conjugate symmetry
 
for s=1:257
    for m=1:257
    r(s,m)=sqrt((s-128.5)^2 + (m-128.5)^2);
    end
end

for b=1:257
    for c=1:257
        if (b-128.5)^2 + (c-128.5)^2 <80^2
            OGimage(b,c)=1*exp(-1i*pi*(r(b,c)/-128));
        end 
    end 
end 

F=log(OGimage+1);

figure (3) 
subplot(1,3,1)
imshow(abs(OGimage),[])
title('Magnitude')

subplot(1,3,2)
imshow(F,[])
title('Phase')


%% part 2, b
kspace_image2=fftshift(fft2(OGimage));
subplot(1,3,3)
imshow(log(abs(kspace_image2)),[])
title('k-space of phase shifted image')

%% part 2,c
% 0 overscans 
for n=1:1:128
    kspace_image2(n,:)=0;
end 

figure (4) 
subplot(1,3,1)
imshow(log(abs(kspace_image2)),[])
title('overscan 0 lines')

kspace_image_recovered2=kspace_image2;
for k=1:128
    for d=1:257
        kspace_image_recovered2(k,d)=conj(kspace_image2(258-k,258-d));
    end
end

figure (4)
subplot(1,3,2)
imshow(log(abs(kspace_image_recovered2)),[])
title('recovered conjugate symmetry')

recovered2=ifft2(fftshift(kspace_image_recovered2));
subplot(1,3,3)
imshow(abs(recovered2),[])
title('recovered image 0')

%% 8 overscans 
kspace_image3=fftshift(fft2(OGimage));
for a=1:1:120
    kspace_image3(a,:)=0;
end 

figure (5) 
subplot(1,3,1)
imshow(log(abs(kspace_image3)),[])
title('overscan 8 lines')

kspace_image_recovered3=kspace_image3;
for i=1:120
    for j=1:257
        kspace_image_recovered3(i,j)=conj(kspace_image3(258-i,258-j));
    end
end

subplot(1,3,2)
imshow(log(abs(kspace_image_recovered2)),[])
title('recovered conjugate symmetry')

recovered3=ifft2(fftshift(kspace_image_recovered3));
subplot(1,3,3)
imshow(abs(recovered3),[])
title('recovered image 8')

%% 16 overscans 
kspace_image4=fftshift(fft2(OGimage));
for e=1:1:112
    kspace_image4(e,:)=0;
end 

figure (6) 
subplot(1,3,1)
imshow(log(abs(kspace_image4)),[])
title('overscan 16 lines')

kspace_image_recovered3=kspace_image4;
for f=1:112
    for g=1:257
        kspace_image_recovered3(f,g)=conj(kspace_image4(258-f,258-g));
    end
end

subplot(1,3,2)
imshow(log(abs(kspace_image_recovered3)),[])
title('recovered conjugate symmetry')

recovered3=ifft2(fftshift(kspace_image_recovered3));
subplot(1,3,3)
imshow(abs(recovered3),[])
title('recovered image 16')

%% 32 overscans 
kspace_image5=fftshift(fft2(OGimage));
for h=1:1:96
    kspace_image5(h,:)=0;
end 

figure (7) 
subplot(1,3,1)
imshow(log(abs(kspace_image5)),[])
title('overscan 32 lines')

kspace_image_recovered4=kspace_image5;
for x=1:96
    for z=1:257
        kspace_image_recovered4(x,z)=conj(kspace_image5(258-x,258-z));
    end
end

subplot(1,3,2)
imshow(log(abs(kspace_image_recovered4)),[])
title('recovered conjugate symmetry')

recovered5=ifft2(fftshift(kspace_image_recovered4));
subplot(1,3,3)
imshow(abs(recovered5),[])
title('recovered image 32')