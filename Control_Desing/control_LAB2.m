% clc
% clear
% close
% s_z=0.01; %step size
% e_t = 10; % end time
% t=0:s_z:e_t; % time
% y=zeros(size(t));
% y(1)=1; %initial condition
% n=numel(y);
% for i = 1:n-1
%     dydt= y(i)+t(i) ;
%     y(i+1) = y(i)+dydt*s_z ;
% end
% plot(t,y,'r--*');
% xlabel('Time (t)')
% ylabel('y(t)')
% title('Eulers Algorithm')
% grid on;


% clc;clear all;close all;
% syms y(t) x(t)
% eqns=[diff(y,t) == -2*x(t) ,  diff(x,t) == y(t)-x(t)];
% conds = [y(0)==1 ,x(0)==1];
% S = dsolve(eqns,conds);
% ySol(t)=S.y;
% xSol(t)=S.x;
% t=0:0.01:11;
% yy=eval(ySol);
% xx=eval(xSol);
% figure(1)
% plot(t,yy, "LineWidth",2);
% hold on
% plot(t,xx, "LineWidth",2);
% title("dsolve")
% figure(2)
% plot(xx,yy);
% 
% h=0.1; %step size
% b=11 % end time
% ti=0:h:b;
% y=zeros(size(ti));
% x=zeros(size(ti));
% n=numel(y);
% y(1)=1;
% x(1)=1;%initial condition
% for i = 1:n-1
%     dydt= -2*x(i) ;
%     dxdt= y(i)-x(i) ;
%     y(i+1) = y(i)+dydt*h ;
%     x(i+1) = x(i)+dxdt*h ;
% end
% figure(3)  
% plot(ti,y, "LineWidth",2);
% hold on
% plot(ti,x, "LineWidth",2);
% legend("t-y","t-x")


clc
clear
close
syms y(t) x(t) z(t)
eqns=[diff(x,t) == 10*(y(t)-x(t)), diff(y,t) == x(t)*(28-z(t))-y(t), diff(z,t) == x(t)*y(t)-(z(t)/3)];
conds = [x(0)==0.1 ,y(0)==-3 , z(0) == 42];
S = dsolve(eqns,conds)