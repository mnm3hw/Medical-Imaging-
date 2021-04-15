%% Design a pulse sequence for T1 mapping. That is, instead of acquiring a T1-
% weighted image, design data acquisition and image analysis methods that would 
% estimate the T1 value for each pixel of the image. Implement a simulation of this 
% in MATLAB using two tissues with T1A = 800 ms and T1B = 400 ms.


%% Question 5 
Mo=1;
Mz=-1;
TA=800;
TB=400;
t=[0:1:5000];

%% 100 ms 
% first RF pulse 180 degrees
MztA_180=(Mz-Mo)*exp(-t/TA)+Mo;
MztB_180=(Mz-Mo)*exp(-t/TB)+Mo;

% 10 degree RF pulse every 100 ms (Yu told me to use these values because
% the ones I was using were > T1A and T1B
new_time=100; %ms
a=10; % angle in degrees
MztA_b4_100=Mo*(1-2*exp(-new_time/TA));
MztB_b4_100=Mo*(1-2*exp(-new_time/TB));

% after 100 ms 
MztA_after_100=MztA_b4_100*cos(a);
MztB_after_100=MztB_b4_100*cos(a);

% Mxy signal at 100 ms 
MxyA_after_100=MztA_after_100*sin(a);
MxyB_after_100=MztB_after_100*sin(a);

%% 200 ms 
% before 200 ms 
MztA_b4_200=Mo+(MxyA_after_100-Mo)*exp(-200/800);
MztB_b4_200=Mo+(MxyB_after_100-Mo)*exp(-200/400);

% after 200 ms 
MztA_after_200=MztA_b4_200*cos(a);
MztB_after_200=MztB_b4_200*cos(a);

% Mxy signal at 200 ms
MxyA_b4_200=MztA_after_200*sin(a);
MxyB_b4_200=MztB_after_200*sin(a);

%% 300 ms 
% before 300 ms 
MztA_b4_300=Mo+(MxyA_b4_200-Mo)*exp(-300/800);
MztB_b4_300=Mo+(MxyB_b4_200-Mo)*exp(-300/400);

% after 300 ms 
MztA_after_300=MztA_b4_300*cos(a);
MztB_after_300=MztB_b4_300*cos(a);

% Mxy signal at 300 ms
MxyA_b4_300=MztA_after_300*sin(a);
MxyB_b4_300=MztB_after_300*sin(a);

%% 400 ms 
% before 400 ms 
MztA_b4_400=Mo+(MxyA_b4_300-Mo)*exp(-400/800);
MztB_b4_400=Mo+(MxyB_b4_300-Mo)*exp(-400/400);

% after 400 ms 
MztA_after_400=MztA_b4_400*cos(a);
MztB_after_400=MztB_b4_400*cos(a);

% Mxy signal at 400 ms
MxyA_b4_400=MztA_after_400*sin(a);
MxyB_b4_400=MztB_after_400*sin(a);

%% 500 ms
% before 500 ms 
MztA_b4_500=Mo+(MxyA_b4_400-Mo)*exp(-500/800);
MztB_b4_500=Mo+(MxyB_b4_400-Mo)*exp(-500/400);

% after 500 ms 
MztA_after_500=MztA_b4_500*cos(a);
MztB_after_500=MztB_b4_500*cos(a);

% Mxy signal at 500 ms
MxyA_b4_500=MztA_after_500*sin(a);
MxyB_b4_500=MztB_after_500*sin(a);

%% 600 ms 
% before 600 ms 
MztA_b4_600=Mo+(MxyA_b4_500-Mo)*exp(-600/800);
MztB_b4_600=Mo+(MxyB_b4_500-Mo)*exp(-600/400);

% after 600 ms 
MztA_after_600=MztA_b4_600*cos(a);
MztB_after_600=MztB_b4_600*cos(a);

% Mxy signal at 600 ms
MxyA_b4_600=MztA_after_600*sin(a);
MxyB_b4_600=MztB_after_600*sin(a);

%% 700 ms 
% before 700 ms 
MztA_b4_700=Mo+(MxyA_b4_600-Mo)*exp(-700/800);

% after 700 ms 
MztA_after_700=MztA_b4_700*cos(a);

% Mxy signal at 700 ms
MxyA_b4_700=MztA_after_700*sin(a);

%% 800 ms 
% before 800 ms 
MztA_b4_800=Mo+(MxyA_b4_700-Mo)*exp(-800/800);

% after 800 ms 
MztA_after_800=MztA_b4_800*cos(a);

% Mxy signal at 800 ms
MxyA_b4_800=MztA_after_800*sin(a);

%% 900 ms 
% before 900 ms 
MztA_b4_900=Mo+(MxyA_b4_800-Mo)*exp(-900/800);

% after 900 ms 
MztA_after_900=MztA_b4_900*cos(a);

% Mxy signal at 900 ms
MxyA_b4_900=MztA_after_900*sin(a);

%% 1000 ms 
% before 1000 ms 
MztA_b4_1000=Mo+(MxyA_b4_900-Mo)*exp(-1000/800);

% after 1000 ms 
MztA_after_1000=MztA_b4_1000*cos(a);

% Mxy signal at 1000 ms
MxyA_b4_1000=MztA_after_1000*sin(a);

%% 
figure (1)
plot(100,MxyA_after_100,'o')
hold on 
plot(200,MxyA_b4_200,'o')
hold on 
plot(300,MxyA_b4_300,'o')
hold on 
plot(400,MxyA_b4_400,'o')
hold on 
plot(500,MxyA_b4_500,'o')
hold on 
plot(600,MxyA_b4_600,'o')
hold on 
plot(700,MxyA_b4_700,'o')
hold on 
plot(800,MxyA_b4_800,'o')
hold on 
plot(900,MxyA_b4_900,'o')
hold on 
plot(1000,MxyA_b4_1000,'o')
title('Mxy estimated signals')
xlabel('Time (ms)')
ylabel('Mxy of the signal')
legend("Tissue A Mxy Points")
%% 
y=[MxyA_after_100; MxyA_b4_200; MxyA_b4_300; MxyA_b4_400; MxyA_b4_500; MxyA_b4_600; MxyA_b4_700; MxyA_b4_800; MxyA_b4_900; MxyA_b4_1000];
x=[100; 200; 300; 400; 500; 600; 700; 800; 900; 1000];
figure (2)
plot(x,y)

hold on 
y=[MxyB_after_100; MxyB_b4_200; MxyB_b4_300; MxyB_b4_400; MxyB_b4_500; MxyB_b4_600];
x=[100; 200; 300; 400; 500; 600];

plot(x,y)
legend("Tisse A T1=800 ms","Tissue B T1=400 ms")
title('Mxy estimated signals')
xlabel('Time (ms)')
ylabel('Mxy of the signal')
%% fit the curve 
yA=[MxyA_after_100; MxyA_b4_200; MxyA_b4_300; MxyA_b4_400; MxyA_b4_500; MxyA_b4_600; MxyA_b4_700; MxyA_b4_800; MxyA_b4_900; MxyA_b4_1000];
xA=[100; 200; 300; 400; 500; 600; 700; 800; 900; 1000];

yB=[MxyB_after_100; MxyB_b4_200; MxyB_b4_300; MxyB_b4_400; MxyB_b4_500; MxyB_b4_600];
xB=[100; 200; 300; 400; 500; 600];

y_fitA=fit(xA,yA,'exp2')
figure (3)
plot(y_fitA,xA,yA)
hold on 
y_fitB=fit(xB,yB,'exp2')
plot(y_fitB,xB,yB)
title('Fit of the curve of the Tissue A and Tissue B points')
xlabel('Time (ms)')
ylabel('Mxy of the signal')
legend('data points A','fit curve A','data points B','fit curve B')

%% solving equation 
a =      0.2368;
b =    0.000464;
c =      -1.247;
d =   -0.007373;
y_fit= a*exp(b*x) + c*exp(d*x)

%% 
y_fit=MxyA_b4_1000*(1-2*exp(-800/T))

syms T
%1500 = MxyA_b4_1000*(1-2*exp(-400/T))
%s=solve(MztA_b4_100)
s=solve(T)