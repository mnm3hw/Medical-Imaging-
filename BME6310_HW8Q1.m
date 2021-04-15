x=[0 1 1 0];
y=[0 0 4 0];
z=conv(x,y);
dftx=fft(x)
dfty=fft(y);
% output is 4+4-1=7
% circular convolution 
cconv1=ifft(fft(x).*fft(y)); % inverse DFT 
answer=cconv(x,y,length(x))