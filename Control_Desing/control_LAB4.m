clear all
close all
clc 

% R = [10 , 1]; C = [0.1 , 0.5];  L = [0.4 , 0.8];
% m =[10 , 1]; B = [1 , 0.5]; K = [0.1 , 0.01];
B =  1  ; K = 1 ; C = 0.1 ; R = 10; L  = 10; m = 1;
z0_a = 1/B ; s1_a = m/B; s0_a = 1;
z0_b = B ; s1_b = B/K; s0_b = 1;

z0_c = 1; s1_c = R*C ; s0_c = 1;
z0_d=1; s1_d = L/R; s0_d = 1;

num = [z0_c];
den =[s1_c s0_c];
sys= tf(num,den)
figure(1)
step(sys)
figure(2)
impulse(sys)



% s0=K(2);s1=B(2);
% num=[1 0];
% den=[s1 s0]
% sys=tf(num,den)
% figure(2)
% impulse(sys)

