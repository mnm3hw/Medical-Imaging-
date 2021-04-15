
%xaxis=1:6;
%stem(xaxis,y)

%x=[-.5 .5 1.5 2.5];
%h=[2 3 4];
syms x h
x=[-.5 2.5];
h=[2 4];
%y=conv(x,h);
xaxis=1:6;
%stem(xaxis,y)
plot([-1 5],rectangularPulse(x))