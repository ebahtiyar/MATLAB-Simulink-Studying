clc
clear
close
syms g rl r1 r2 r3 c1 c2 s
g=(r1+r2+c1*r1*r2*s+c2*r1*r2*s+c1*c2*r1*r2*r3*s^2);
roots = solve(g==0,s)
%r = 1000 and 4500 in our table
r1 = 1000;
r2 = 1000;
r3 = 1000;
% c = 10^-6 , 10^-5 and 10^7 in our table
c1 = 10^-7;
c2 = 10^-7;
roots = subs(roots);    
bandwidth = (roots(2)-roots(1))/(2*pi*i)
Amax = abs(-r3/(2*r1));
gb = (20*log10(Amax)) * bandwidth;
gb = double(gb)