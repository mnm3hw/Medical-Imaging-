x=[3:10];
h=[-3:10];
y=conv(x,h);
xaxis=1:21;
subplot(2,1,1)
stem(xaxis,y)

subplot(2,1,2)
m=[1:10];
stem(m)