x=[1 1 0 0];
y=[1 0 0 1];
z=conv(x,y)
dftx=fft(x);
dfty=fft(y);
% output is 4+4-1=7
% circular convolution 
cconv1=ifft(fft(x).*fft(y)); % inverse DFT 
answer=cconv(x,y,4)