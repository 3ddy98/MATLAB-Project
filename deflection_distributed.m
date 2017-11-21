function y = deflection_distributed(a,b,x,y,series_multiplier_distributed)

storage = [];
% sin_x_function = sin((m.*pi.*x)./a);
% sin_y_function = sin((n.*pi.*y)./b);
% dividing_function = (m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2;
total_function_summed = 0;
total_summed = 0;
for m= 1:2:19
  for n = 1:2:19

    total_function_summed = total_function_summed + (series_multiplier_distributed)*(sin((m.*pi.*x)./a)*sin((n.*pi.*y)./b))/((m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2);

  end
end
s = max(max(total_function_summed));
disp(s)
surf(X,Y,Z)
xlabel('x - pos (in)')
ylabel('in')
zlabel('in')
