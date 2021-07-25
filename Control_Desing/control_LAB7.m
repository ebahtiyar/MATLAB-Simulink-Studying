clc
clear
close
t=0:0.001:5;
num=[210.25];
den=[1 5.8 0];
G=tf(num, den)
figure(1)
rlocus(G)
figure(2)
T = feedback(G,1)
step(T)
figure(3)
lsim(T,t,t)

num_1=[170];
den_1=[1 22 0];
G_1= tf(num_1,den_1)
figure(4)
rlocus(G_1);
T_1 = feedback(G_1,1)
figure(5)
step(T_1)
figure(6)
lsim(T_1,t,t)



