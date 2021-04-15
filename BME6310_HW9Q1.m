x=[0 1 0 1];
y=[2 1 1 2];
dftx=fft(x);
dfty=fft(y);
mult=dftx.*dfty;
circleconv=ifft(mult)
% circular convolution 
cconv1=ifft(fft(x).*fft(y)); % another way to do it 
answer=cconv(x,y,4) % another way using the built in function 