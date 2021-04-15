% Case 1 
N0= [10000];
tspan=[0 50];
[t,N]= ode45(@computedNdt,tspan,N0);
figure (1)
plot(t,N(:,1),'b')
title('Mosquito Population vs Time');
xlabel('time [days]');
ylabel('Number of Mosquitos');
hold on

% Case 2 doubled intrinsic growth rate, R 
N2=[10000];
tspan=[0 50];
[t,N]= ode45(@computedNdt2,tspan,N2);
plot(t,N(:,1),'r');
legend('Initial Conditions','Doubled Intrinsic Growth Rate');
