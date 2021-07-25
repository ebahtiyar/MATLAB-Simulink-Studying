    clear all
    close all
    clc

%     num = [1 3];
%     den = [1 7 14 8 0];
%     g = tf(num,den)
%     figure(1)
%     rlocus(g)
%     [k poles] = rlocfind(g)
%     T = feedback(g*k,1)
%     rlocus(T)
%     grid


num = [1];
den = [1 3 5 0];
g = tf(num,den)
k = 50
T = feedback(g*k,1)
figure(1)
rlocus(T)   
grid
figure(2)
step(T)
xlim([80 90])