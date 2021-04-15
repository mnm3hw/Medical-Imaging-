% Time profiles in the N stages of differentiation/replication process

%% initial conditions for continuous input, with death/transdiff. 
N=10;
I=195312500;
tzero=0; tmax=10; tspan=[tzero:0.1:tmax];
Xzero=zeros(N+1,1);               %initial condition
k=2.2*ones(N,1);                  %transition rate constant, with death at 200x10^9 cells

%% integrate replication
[t,X]=ode45('erythropoiesis',tspan,Xzero,[],N,I,k);
% pseudo steady state values 
ss=2^9*I/k(10);          %if N=10, n-1=9 so 2^9, steady state is at 2^i-1*I/k(N)
X_last=X(length(X),N);
% print answers in command window
fprintf('The steady state number of cells in all stages = %d',ss)

%% cell replication plot
% plot the time profiles in the N stages of differentiation and replication
% processes 
figure (1); subplot(2,1,1); 
plot(t,X(:,1:1:N))
title('Replication Time Profile');
xlabel('Time [days]');
ylabel('Number of Stem Cells');
axis([tzero,tmax,0,ss])
legend('1','2','3','4','5','6','7','8','9','10','Location','eastoutside')

%% cell differentiation 
% code from class cell_differentiation_equations.m case (c)
N=10;
tzero=0; tmax=10; tspan=[tzero:0.1:tmax];
I=195312500;
Xzero=zeros(N,1);
k(N)=k(1);
[t,X]=ode45('cell_differentiation_equations',tspan,Xzero,[],N,I,k);
% Pseudo steady state values for stages 1 to N-1
SS=I/k(9);
X_last=X(length(X),N);
disp(' ')
disp('Case C from Class')
fprintf('The steady state number of cells in all stages=%d',SS)

%% cell differentiation plot
subplot(2,1,2)
plot(t,X(:,1:1:N))
axis([tzero, tmax, 0, 1.1*I/k(1)])
title('Differentiation Time Profile ');
xlabel('Time [days]');
ylabel('Number of Stem Cells');
legend('1','2','3','4','5','6','7','8','9','10','Location','eastoutside')
