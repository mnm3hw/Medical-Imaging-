%% Question 1 

%% 180 degrees 
clear all
P = phantom(512); 
R = radon(P,0:179);             % Note only need to scan 180 degrees
I1 = iradon(R,0:179);
I2 = iradon(R,0:179,'linear','none');
I3 = iradon(R,0:179,'linear','Ram-Lak');
I4 = iradon(R,0:179,'linear','Shepp-Logan');

figure (1)
axis equal
subplot(2,3,1), imshow(P), title('Original')
subplot(2,3,2), imshow(I1), title('Filtered backprojection')
subplot(2,3,3), imshow(I2,[]), title('Unfiltered backprojection')
subplot(2,3,4), imshow(I3), title('Ram-Lak')
subplot(2,3,5), imshow(I4), title('Shepp-Logan')
figure (2)
imshow(R)
%% 0 degrees 
P = phantom(512);
R = radon(P,0:179);
r0 = R(:,1);
I = iradon([r0 r0], [0 0])/2;
I2= iradon([r0 r0], [0 0],'linear','none')/2;
I3= iradon([r0 r0], [0 0],'linear','Ram-Lak')/2;
I4 = iradon([r0 r0], [0 0],'linear','Shepp-Logan')/2;
% Repeat the above for additional angles per question
figure (2)
axis equal
subplot(2,2,1), imshow(I, []), title('Backprojection 0-degree') 
subplot(2,2,2), imshow(I2, []), title('Unfiltered backprojection 0')
subplot(2,2,3), imshow(I3), title('Ram-Lak 0')
subplot(2,2,4), imshow(I4), title('Shepp-Logan 0')
%% 45 degrees 
P = phantom(512);
R = radon(P,0:179);
r45 = R(:,46);
I = iradon([r45 r45], [45 45])/2;
I2= iradon([r45 r45], [45 45],'linear','none')/2;
I3= iradon([r45 r45], [45 45],'linear','Ram-Lak')/2;
I4 = iradon([r45 r45], [45 45],'linear','Shepp-Logan')/2;
% Repeat the above for additional angles per question
figure (3)
axis equal
subplot(2,2,1), imshow(I, []), title('Backprojection 45-degree') 
subplot(2,2,2), imshow(I2, []), title('Unfiltered backprojection 45')
subplot(2,2,3), imshow(I3), title('Ram-Lak 45')
subplot(2,2,4), imshow(I4), title('Shepp-Logan 45')

%%  90 degrees
P = phantom(512);
R = radon(P,0:179);
r90 = R(:,91);
I = iradon([r90 r90], [90 90])/2;
I2= iradon([r90 r90], [90 90],'linear','none')/2;
I3= iradon([r90 r90], [90 90],'linear','Ram-Lak')/2;
I4 = iradon([r90 r90], [90 90],'linear','Shepp-Logan')/2;
% Repeat the above for additional angles per question
figure (4)
axis equal
subplot(2,2,1), imshow(I, []), title('Backprojection 90-degree') 
subplot(2,2,2), imshow(I2, []), title('Unfiltered backprojection 90')
subplot(2,2,3), imshow(I3), title('Ram-Lak 90')
subplot(2,2,4), imshow(I4), title('Shepp-Logan 90')

%% 135 degrees 
P = phantom(512);
R = radon(P,0:179);
r135 = R(:,136);
I = iradon([r135 r135], [135 135])/2;
I2= iradon([r135 r135], [135 135],'linear','none')/2;
I3= iradon([r135 r135], [135 135],'linear','Ram-Lak')/2;
I4 = iradon([r135 r135], [135 135],'linear','Shepp-Logan')/2;
% Repeat the above for additional angles per question
figure (5)
axis equal
subplot(2,2,1), imshow(I, []), title('Backprojection 135-degree') 
subplot(2,2,2), imshow(I2, []), title('Unfiltered backprojection 135')
subplot(2,2,3), imshow(I3), title('Ram-Lak 135')
subplot(2,2,4), imshow(I4), title('Shepp-Logan 135')

%% calculate RMS error between the image and original phantom

fixI1=I1(2:513,2:513)
rms=sqrt(sum(sum((P-fixI1).^2/512.^2)))
     
rms3=sqrt((sum(sum((P-fixI1).^2)))./512.^2)
% check rms equation to see if i need to scale by n=512        
rms2=sqrt(mean(mean((P-fixI1).^2)))

error=(P-fixI1);
squared_error=(P-fixI1).^2;
mean_se=mean(mean((P-fixI1).^2));
RMSE=sqrt(mean(mean((P-fixI1).^2)))

%% Question 2
x=[-5.0:0.05:5.0];
y=[-5.0:0.05:5.0];
z=[-5.0:0.05:5.0];
vol_matrix=zeros (length(x), length(y), length(z));
square=zeros (length(x), length(y));
r=1;
for i=1:201
    for j=1:201
        if x(i)^2+y(j)^2 < r^2
    square(i,j)=1;
        end 
    end 
end 
figure (6)
colormap(gray)
imagesc(square)

% 180 degrees 
Rnew=myRadon(square,0:179);
%I180 = iradon(Rnew,0:179);
I180 = iradon(Rnew,0:179,'linear','none');
% 0 degrees 
r0 = Rnew(:,1);
I0 = iradon([r0 r0], [0 0])/2;
% 45 degrees
r45 = Rnew(:,46);
I45 = iradon([r45 r45], [45 45])/2;
% 90 degrees 
r90 = Rnew(:,91);
I90 = iradon([r90 r90], [90 90])/2;
% 135 degrees 
r135 = Rnew(:,136);
I135 = iradon([r135 r135], [135 135])/2;

figure (7)
subplot (2,3,1), imshow(I180,[]), title('Unfiltered backprojection 180')
subplot (2,3,2), imshow(I0), title('Backprojection 0')
subplot (2,3,3), imshow(I45), title('Backprojection 45')
subplot (2,3,4), imshow(I90), title('Backprojection 90')
subplot (2,3,5), imshow(I135), title('Backprojection 135')
title("Slice when z=0 cm")




