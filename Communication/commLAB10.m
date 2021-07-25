clc;clear all; close all;

%% uniform random variable, 
%x vary uniformly between a and b (a<b). 
%f(x)=1/(b-a)
% 
% L=1e5;
% a=1;
% b=3;
% x= a+(b-a)*rand(1,L); %generates uniformly random variabe between 1 and 3.
% [N,X]=hist(x,10);
% plot(X,N/sum(N))
% ylim([0 1])
% xlim([0 5])

%% Normal (Gauessian) Random Variable
% randn generates standard normal variables (meam=mu, varaince=nvar)
% L=1e5;
% mu=2;
% nvar=9;
% nstd=sqrt(nvar);
% x= mu+sqrt(nvar)*randn(1,L); 
% [N,X]=hist(x,20);
% 
% T=7; %finf the prob that P(x>T)
% [u,v]=find(x>T);
% P_sim= length(v)/L;
% P_theo=qfunc((T-mu)/nstd);
% 
% alpha_val=0.1 %finf the value of T where P(X>T)=alpha_val
% %qfunc((T-mu)/nstd)= alpha_val
% %qfuncinv(alpha_val)=T-mu)/nstd
% T2=nstd*qfuncinv(alpha_val)+mu;
% [u,v]=find(x>T2);
% P_verif= length(v)/L;


%% consider on-off transmission Bit0-->r=n, Bit1-->r=A+n
%radar detection
%a0:Aircraft absent, r=n
%H1: aircraft presence, r=A+n
%n~N(0,nvar)
T_vec= -2:7;
c=1;
while c<=length(T_vec)
    L=1e5;
    A=5;
    T=T_vec(c);
    nvar=3;
    nstd=sqrt(nvar);
    n=nstd*randn(1,L); 
    %under H0,
    r0=n;
    [u0,v0]=find(r0>T);
    P_FA_sim(c)=length(v0)/L;
    P_FA_theo(c)=qfunc((T-0)/nstd);
    %under H1,
    r1=A+n;
    [u1,v1]=find(r1<T);
    P_Miss_sim(c)=length(v1)/L;
    P_Miss_theo(c)=1-qfunc((T-A)/nstd);
    P_Det_sim(c)=1-P_Miss_sim(c);
    P_Det_theo(c)=1-P_Miss_theo(c);
    c=c+1;
end
figure(1)
 plot(T_vec,P_FA_sim,'r*',T_vec,P_FA_theo,'b-o')
 hold on
  plot(T_vec,P_Miss_sim,'mp',T_vec,P_Miss_theo,'y-o')
  grid on
  
  figure(2)
  plot(P_FA_sim,P_Miss_sim,'r-*')
  hold on
   plot(P_FA_theo,P_Miss_theo,'b*')
   grid on