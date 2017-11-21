function max_distributed_rectangular = deflection_distributed_rectangular(a,b,x,y,q0,D)
% sin_x_function = sin((m.*pi.*x)./a);
% sin_y_function = sin((n.*pi.*y)./b);
% dividing_function = (m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2;
series_multiplier_distributed= (16*q0)/(pi^6*D);
total_function_summed = 0;
[X,Y] = meshgrid(x,y);
for m= 1:2:19
  for n = 1:2:19

    total_function_summed = total_function_summed + (series_multiplier_distributed).*(sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b))./((m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2);

  end
end
max_distributed_rectangular = max(max(total_function_summed));
disp(s)
contour(X,Y,total_function_summed)
xlabel('x - pos (in)')
ylabel('y - pos (in)')
zlabel('Deflection (in)')
