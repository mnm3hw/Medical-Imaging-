syms t
y=piecewise(1<t<2,-1,2<t<3,1,3<t<4,4,4<t<5,2);
bt=piecewise(0<t<2,1);
subplot(2,1,1)
fplot(y)
subplot(2,1,2)
fplot(bt)