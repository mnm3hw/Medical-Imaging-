% Plot the function 
% f(x)=3xcos^2x-2x
% and its derivative, on the same plot for -2pi <= x <= 2pi
% plot the function with a solid line, and the derivative with a dashed
% line. 
%Add a legend and label the axes.
syms x y
f(x)=(3.*x.*cos(x).^2)-(2.*x);
df=diff(f,x);
fplot(f,[-2.*pi 2.*pi])
grid on
hold on
fplot(df,[-2.*pi 2.*pi],'--');
xlabel('x axis')
ylabel('y axis')
legend('f(x)','df(x)')
title('Function and Derivative')


