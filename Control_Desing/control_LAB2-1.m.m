% clc;
% clear;
% close;
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
% subplot(2,1,1)
% plot(t,xx, "LineWidth",3);
% hold on
% plot(t,yy, "LineWidth",3);
% legend("x(t)","y(t)")
% xlabel("Time")
% title('Symbolic Results')
% subplot(2,1,2)
% plot(xx,yy,"LineWidth",2);
% legend("(x,y)")
% xlabel("x")
% ylabel("y")
% clc;
% clear;
% close;
% h = 0.8
% b=11; % end time
% t=0:h:b;
% y=zeros(size(t));
% x=zeros(size(t));
% n=numel(y);
% y(1)=1; %initial condition
% x(1)=1;
% for i = 1:n-1
%     dydt= -2*x(i) ;
%     dxdt= y(i)-x(i) ;
%     y(i+1) = y(i)+dydt*h ;
%     x(i+1) = x(i)+dxdt*h ;
% end
% figure(2)
% subplot(2,1,1)
% plot(t,x, "LineWidth",2);
% hold on
% plot(t,y, "LineWidth",2);
% legend("x(t)","y(t)")
% xlabel("Time")
% title(['Numerical Results Step Size = ',num2str(h)])
% subplot(2,1,2)
% plot(x,y,"LineWidth",3);
% legend("(x,y)")
% xlabel("x")
% ylabel("y")

% clc;
% clear; 
% close;
% TSPAN = [0 20];
% COND=[0.1 -3 42];
% figure(1)
% OPTIONS = odeset('RelTol',1e-1,'AbsTol',1e-3);
% [TOUT,YOUT] = ode23('funsys',TSPAN,COND,OPTIONS);
% x=YOUT(:,1);
% y=YOUT(:,2);
% z=YOUT(:,3);
% figure(1)
% plot3(x, y, z,"b-", "LineWidth",3)
% legend("RelTol=1e-1,AbsTol=1e-3")
% %Default
% OPTIONS = odeset('RelTol',1e-3,'AbsTol',1e-6);
% [TOUT,YOUT] = ode23('funsys',TSPAN,COND,OPTIONS);
% x=YOUT(:,1);
% y=YOUT(:,2);
% z=YOUT(:,3);
% figure(2)
% plot3(x, y, z,"g-", "LineWidth",3)
% legend("RelTol=1e-3,AbsTol=1e-6")
% 
% OPTIONS = odeset('RelTol',1e-12,'AbsTol',1e-18);
% [TOUT,YOUT] = ode23('funsys',TSPAN,COND,OPTIONS);
% x=YOUT(:,1);
% y=YOUT(:,2);
% z=YOUT(:,3);
% figure(3)
% plot3(x, y, z,"r-", "LineWidth",3)
% legend("RelTol=1e-12,AbsTol=1e-18")

    clc;
    clear; 
    close;
    h=0.00001; %step size
    b=20 % end time
    t=0:h:b;
    y=zeros(size(t));
    x=zeros(size(t));
    z=zeros(size(t));
    n=numel(y);
    x(1)=0.1;
    y(1)=-1;
    z(1)=42;
    for i = 1:n-1
        dxdt= 10*(y(i)-x(i)) ;
        dydt= x(i)*(28-z(i))-y(i) ;
        dzdt=x(i)*y(i)-z(i)/3;
        y(i+1) = y(i)+dydt*h ;
        x(i+1) = x(i)+dxdt*h ;
        z(i+1) = z(i)+dzdt*h ;
    end
    figure(1)
    plot3(x,y,z, "b-", "LineWidth",3);
    title("Numerical Result")

