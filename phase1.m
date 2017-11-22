d = 10;
h = 10;
E = 10;
v = 10;
P = 10;
q0 = 10;


function max_point_circle = deflection_point_circle(d,h,E,v,P)
%Point load on a circular plate
%case 8
% d=24;
% h=.25;
% E=30*10^6;
% v=.3;
% p=2500;

%case 9
% d=24;
% h=.25;
% E=30*10^6;
% v=.3;
% p=2500;

%case 10
% d=.1;
% h=.002;
% E=70*10^9;
% v=.334;
% p=2000;

a=d/2;
r = 0:.1:a;
theta = 0:pi/8:2*pi;
[R, ~ ] = meshgrid(r,theta);

D=(E*h^3)/(12*(1-v^2));

W=(P)./(16.*pi.*D).*(((3+v)./(1+v)).*(a.^2-R.^2)+2.*R.^2.*log(R./a));

%X = R.*cos(THETA);
%Y = R.*sin(THETA);
%surf (X,Y,W)
wr = W(1,:);
% deflection w(r) is first row of W matrix
plot(r,wr);
max_point_circle = max(max(W));
end

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
end
