x=[-5 -4 -3 -2 -1 0 1];
y=[-3 -2 -3 0 1 2 3 4];
convolution=conv(x,y);
%xaxis=[1:length(x)+length(y)-1]; finds the width =14 
xaxis=-8:5;
stem(xaxis,convolution)
