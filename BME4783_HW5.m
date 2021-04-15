%% BME 4783
% MRI Homework 5 

%% part a 
time=.00512; % in s 
samples=256;
deltaT=(time/samples); % in s 
FOV=300/1000; % in m 
gamma=42.5771*10^6; % in Hz/T

readout_gradient=1/(FOV*deltaT*(2*pi/gamma)) % in T/m
%% part b
TR=10; % in ms
samples=256;
number_phase_encodes=256/2;

readout_time=TR*number_phase_encodes % answer in ms 
%% part b (2)
% create a sphere inside of a cube image in 2D 
% cube 
x=[-6.375:0.05:6.375];
y=[-6.375:0.05:6.375];
image_water=zeros (length(x), length(y));

% sphere
r=2.4;
for b=1:256
    for c=1:256
        if x(b)^2+y(c)^2 < r^2
    image_water(b,c)=1;
        end 
    end 
end 
figure (1)
subplot(2,2,1)
colormap(gray)
imshow(image_water)
title("image domain")

% take the fourier transform of the image 
kspace_water=fft2(image_water);
FT_square4=fft2(image_water);

%% 
ifft_shift=ifft2(kspace_water);
imshow(ifft_shift)

%%
subplot(2,2,2)
imshow(kspace_water) 
title("k space image")

% make every other phase-encode lines appear 
kspace_water(2:2:end)=0;

% take the ift
IFT_square=ifft2(kspace_water);
subplot(2,2,3)
imshow(IFT_square)
title("image domain:every other phase-encode line")

% aquire every fourth line of the image 
FT_square4(1:4:end)=0;
IFT_square4=ifft2(FT_square4);
subplot(2,2,4)
imshow(abs(IFT_square4))
title("image domain: every 4th phase-encode line")


%% part c 
x=[-6.375:0.05:6.375];
y=[-6.375:0.05:6.375];
image_water=zeros (length(x), length(y));

% sphere
r=2.4;
for s=1:256
    for m=1:256
        if x(s)^2+y(m)^2 < r^2
            image_water(s,m)=1;
        end 
    end 
end 
figure (5)
subplot(2,2,1)
colormap(gray)
imshow(image_water)
h = gca;
h.Visible = 'On';
title("image water")

% take the fourier transform of the image 
kspace_water=fft2(image_water);
subplot(2,2,2)
imshow(kspace_water)
h = gca;
h.Visible = 'On';
title("kspace water")

% shift the kspace water to kspace fat by 2000 Hz 
f=2000; % HZ 
time_step=0.02/1000; % in s 
total_time=5.12/1000; % in s 

time_step=[0:0.00002:0.00511];
phase=[1:256];


fdomain=zeros (length(time_step),length(phase));


for k=1:256
    for l=1:256
        fdomain(k,l)=time_step(l)+0.00002;
        phase(k,l)=f.*fdomain(k,l);
   end 
end



shift=exp(1i*2*pi*phase);

kspace_fat=kspace_water.*shift;
subplot(2,2,3)
imshow(kspace_fat)
h = gca;
h.Visible = 'On';
title("kspace fat")

image_fat=ifft2(kspace_fat);
subplot(2,2,4)
imshow(image_fat)
h = gca;
h.Visible = 'On';
title("image fat") 

%% result calculated using the fourier transform shift 
% applied in image domain
f=2000; % Hz
time=0.0002 % in s
freq_domain=exp(1i*f*time)







