%% stiff with ode45
clear
tic
y0 = [0; 0];
tspan = [0 10];
[t,y] = ode45(@stiffODE,tspan,y0);
figure(1); 
plot(t,y(:,1),'go')
toc

%% stiff with ode15s
clear
tic
y0 = [0];
tspan = [0 15];
[t,y] = ode15s(@stiffODE,tspan,y0);
figure(2); 
plot(t,y(:,1),'go')
toc

%% stiff with ode23s
clear
tic
y0 = [0];
tspan = [0 4];
[t,y] = ode23s(@stiffODE,tspan,y0);
figure(3); 
plot(t,y(:,1),'go')
toc

%% stiff with explicit euler's method 
clear
tic
figure(4); hold on;
y_i = 0;
h = .00055; 
for t = 0:h:4
    dydt = -10*y_i + 100 - 40*exp(-t);
    y_i_plus_1 = y_i + dydt*h;
    plot(t,y_i_plus_1, 'go:');
    y_i = y_i_plus_1;
end
toc

%% stiff with implicit euler's methods
clear
tic
figure(5); hold on;
y_i = 0;
h = .01;
for t = 0:h:4
    y_i_plus_1 = (y_i + 100*h - 40*h*exp(-(t+h)) ) / (1 + 10*h);
    plot(t,y_i_plus_1, 'go');
    y_i = y_i_plus_1;
end
toc
