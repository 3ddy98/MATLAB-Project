
%Case 6
% x0=5;
% y0=10;
% a=10;
% b=20;
% x=0:1:a;
% y=0:1:b;
% h=.125;
% E=10000000;
% v=.3;
% q0=80;
% P=120;

%Case 7
a = 10;
b = 20;
h = .125;
E = 10000000;
v = .3;
q0 = 40;
P = 120;
x0 = 2;
y0 = 10;


D=(E*h^3)/(12*(1-v^2));

[X,Y] = meshgrid(x,y);
Z = 0;
for m = 1:1:10
    for n = 1:1:10
        Z = Z + ((4*P)/((pi^4)*a*b*D)).*(((sin((m.*pi.*x0)./a).*sin((n.*pi.*y0)./b))./(((m^2/a^2)+(n^2/b^2))^2)).*sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b));
    end
end
%s = max(max(Z));
%disp(s)
series_multiplier_distributed= (16*q0)/(pi^6*D);
total_function_summed = 0;

for m= 1:2:19
  for n = 1:2:19

    total_function_summed = total_function_summed + (series_multiplier_distributed).*(sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b))./((m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2);

  end
end
both_sum = total_function_summed + Z;
s = max(max(both_sum));
disp(s)
contour(X,Y,both_sum)
xlabel('x - pos (in)')
ylabel('y - pos (in)')
zlabel('Deflection (in)')
