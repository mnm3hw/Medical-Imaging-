% c) systemC
%% test linearity 
v1= [zeros(1,20) 1 zeros(1,20)];
v2= [zeros(1,20) 1 zeros(1,20)];
a1=2;
a2=3;
wlin_together=systemC(a1.*v1+a2.*v2);
wlin_apart=a1.*systemC(v1)+a2.*systemC(v2);
subplot(4,1,1)
stem(wlin_together);
title('left side linearity')
subplot(4,1,2)
stem(wlin_apart);
title('right side of linearity')

%% test for shift invariant or shift variant  
v1= [zeros(1,19) 1 zeros(1,21)];
v2= [zeros(1,18) 1 zeros(1,22)];
wvar=systemC(v1);
wvar2=systemC(v2);
subplot(4,1,3)
stem(wvar)
title('shifted to left by 1')
subplot(4,1,4);
stem(wvar2)
title('right side shift variance test')


