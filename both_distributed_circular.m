
d=8;
h=.25;
E=30*10^6;
v=.3;
q=150;
a=d/2;
r = 0:.5:a;

theta = 0:pi/24:2*pi;
[R, THETA] = meshgrid(r,theta);

D=(E*h^3)/(12*(1-v^2));

%-----Distributed Circle-----%

W_distributed=((q.*(a.^2-R.*2))./(64.*D)).*(((5+v)./(1+v)).*a.^2-R.^2);

%surf (X,Y,W)
%disp(max(max(W)))

%----Point Circle-----%

D=(E*h^3)/(12*(1-v^2));

W_point=(p)./(16.*pi.*D).*(((3+v)./(1+v)).*(a.^2-R.^2)+2.*R.^2.*log(R./a));


%-------Both-------%
total = W_point + W_distributed;
disp(max(max(total)));

X = R.*cos(THETA);
Y = R.*sin(THETA);
contour(X,Y,total);
