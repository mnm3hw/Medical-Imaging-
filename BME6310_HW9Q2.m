% a) determine and plot the circular convolution of f with itself 
f=[0:0.01:1 0.99:-0.01:0];
figure (1) 
plot(f)
title('triangle function') 
cconv1=ifft(fft(f).*fft(f));
%cconv2=cconv(f,f,length(f)); % different method using built in function 
figure (2)
subplot(3,1,1)
stem(cconv1)
title('a) circular convolution of f with itself')

% b) determine and plot the discrete convolution of f with itself 
convf=conv(f,f);
subplot(3,1,2)
stem(convf)
title('b) using conv function')

%c) determine and plot the discrete convolution by zero-padding
padf=[f zeros(1,401-length(f))];
cconv3=ifft(fft(padf).*fft(padf));
subplot(3,1,3)
stem(cconv3)
title('c) zero-padding')