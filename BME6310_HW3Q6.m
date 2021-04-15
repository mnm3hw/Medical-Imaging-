% Do 2 steepest descent steps for:
% f(X)=x1^2+2x2^2-x1-6x2
% x0=[0 0]^T

x = [0,0];
f = @(x)(x(1)^2+2.*x(2)^2-x(1)-6.*x(2));
fans = fminsearch(f,[0,0])

%% Calculating the maximum value 
x1=0.5;
x2=1.5;
maximum=(x1^2)+(2.*x2^2)-x1-(6.*x2)