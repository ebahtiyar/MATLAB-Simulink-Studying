clc
clear
close

syms s K
poles = solve(s*(s+1)*(s+2)*(s+4)==0,s);
poles = poles' % poles
zeros = solve(s+3==0,s)


G(s) = (s+3)/(s*(s+1)*(s+2)*(s+4)); % open loop transfer function.
T(s) = (K*G(s))/(1+K*G(s)) % closed loop transfer function.
ch_eq = simplify(1/(T(s)/(K*(s+3))))%characteristic equation.

loci = max(length(poles),length(zeros))% number of loci

diff =(length(poles)-length(zeros));
center_asymp = (sum(poles)-sum(zeros))/diff

for i=0:diff-1
angles_asymp(i+1) = (2*i+1)*pi/diff;
end
angles_asymp

eq = (K^2 + 65*K-720);
assume(K,'positive')
gain = double(solve(eq==0)) %gain K
eq_1 = (((90+gain)/7)*s^2)+3;
points_jw_axis = double(solve(eq_1==0))' %points that cross the jw axis   

eq_2= 3*s^4+26*s^3+77*s^2+84*s+24;
s_breakaway =solve(eq_2==0,s);
s_breakaway = double(s_breakaway)' % break-in point(s).


