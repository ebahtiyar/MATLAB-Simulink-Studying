clc; 
clear all;
close ;
% %R=10; L=1; C=1;
% %R=1; L=1; C=1;
% %R=0.5; L=1; C=1;
% R=0; L=1; C=1;
% 
% 
% num_I=[1/L 0];
% den_I=[1 R/L 1/(C*L)];
% num_V=[1/(C*L)];
% den_V=[1 R/L 1/(C*L)];
% sys_I= tf(num_I,den_I);
% sys_V= tf(num_V,den_V);
% damp(sys_I);
% damp(sys_V);
% [Z_I,P_I,K_I] = tf2zp(num_I,den_I);
% [Z_V,P_V,K_V] = tf2zp(num_V,den_V);
% 
% figure(1)
% subplot(2,1,1)
% pzmap(sys_I)
% subplot(2,1,2)
% step(sys_I)
% figure(2)
% subplot(2,1,1)
% pzmap(sys_V)
% subplot(2,1,2)
% step(sys_V)

num = [12 60];
den = [1 30 200];
sys = tf(num,den)
ltiview(sys)
pzmap(sys)
