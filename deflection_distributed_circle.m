function max_distributed_circle = deflection_distributed_circle(d,h,E,v,q0)
%d=8;
%h=.25;
%E=30*10^6;
%v=.3;
%q=150;

a=d/2;
r = 0:.5:a;
theta = 0:pi/24:2*pi;
[R, THETA] = meshgrid(r,theta);

D=(E*h^3)/(12*(1-v^2));

W=((q0.*(a.^2-R.*2))./(64.*D)).*(((5+v)./(1+v)).*a.^2-R.^2);

X = R.*cos(THETA);
Y = R.*sin(THETA);
surf (X,Y,W)
max_distributed_circle = max(max(W));
