%% Question 3
t=[0:1:5000]; % time in ms 
Mo=1;
Ta=800;
Tb=400;
Mz=0;
Mzta=(Mz-Mo)*exp(-t/Ta)+Mo;
Mztb=(Mz-Mo)*exp(-t/Tb)+Mo;

figure (1)
plot(t,Mzta)
hold on 
plot(t,Mztb)
xlabel("Time [ms]")
ylabel("Mz(t)")
title("Plot of Mz(t) from t=0 to t=5 sec. at 90 RF pulse")
legend("T1=800 ms","T1=400 ms")
% Question 3b
MztA_signal=Mo*(1-exp(-500/800))
Mzt500A=0; 
MztB_signal=Mo*(1-exp(-500/400))
Mzt500B=0; 
% short T1 bright 
% long T1 dark 
%% Question 4
Mo=1;
Mz=-1;
TA=800;
TB=400;
t=[0:1:5000]; % time in ms 
MztA=(Mz-Mo)*exp(-t/TA)+Mo;
MztB=(Mz-Mo)*exp(-t/TB)+Mo;

figure (2)
plot(t,MztA)
hold on 
plot (t,MztB)
xlabel("Time [ms]")
ylabel("Mz(t)")
title("Plot of Mz(t) from t=0 to t=5 sec. at 180 RF pulse")
hold on 
%% Question 4 Part 2
difference=MztB-MztA;
plot (t,difference)
hold on

[maxYValue, indexAtMaxY] = max(difference);
xValueAtMaxYValue = t(indexAtMaxY(1))
plot(555,0.5,'b*')
legend("T1A=800 ms","T1B=400 ms","Difference between two Mz(t) curves","Time where signal is greatest")

%% Question 5 
Mo=1;
Mz=-1;
TA=800;
TB=400;
t=[0:500:5000];
for i=1:11  %=1:500:5001
    MztA(i)=(Mz-Mo)*exp(-t(i)/TA)+Mo;
    MztB(i)=(Mz-Mo)*exp(-t(i)/TB)+Mo;

end
figure (3)
plot(t,MztA)
hold on
plot (t,MztB)
xlabel("Time [ms]")
ylabel("Mz(t)")
title("Plot of Mz(t) from t=0 to t=5 sec. at 180 RF pulse")
hold on 

%% 
im=imread('im.png');
imshow(im)

%%
re_im=reshape(im,256,256);
TI=[0.01 0.03 0.4 0.5 1 1.25 1.5 1.75 3 5 9];
eq=fittype('a*(1-2*exp(-x/T1))','coefficients',{'a','T1'});
x=zeros(128,128,9);
for row=[1:256]
    for col=[1:256]
        for im =[1:15]
   signal=re_im(row,col,:,im);
   T1f=fit(TI,signal,eq);
   x(row,col,im)=T1f;
   end
    end
end
    



