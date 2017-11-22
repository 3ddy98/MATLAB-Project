function max_point_rectangular = deflection_point_rectangular(x0,y0,a,b,x,y,P,D)
%3.11
%.311

%         sin_xo_function = sin((m*pi*x_o)/a); %sin equation with Xo
%         sin_yo_function = sin((n*pi*y_o)/b); %sin equation with Yo
%         dividing_function = ((m^2/a^2)+(n^2/b^2))^2; %equation that divides in the sum
%         sin_x_function = sin((m*pi*x)/a); % sin equation with X assuming X = a
%         sin_y_function = sin((n*pi*y)/b); %sin equation with Y assuming Y =
[X,Y] = meshgrid(x,y);
Z = 0;
for m = 1:1:10
    for n = 1:1:10
        Z = Z + ((4*P)/((pi^4)*a*b*D)).*(((sin((m.*pi.*x0)./a).*sin((n.*pi.*y0)./b))./(((m^2/a^2)+(n^2/b^2))^2)).*sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b));
    end
end
max_point_rectangular = max(max(Z));
disp(s)
surf(X,Y,Z)
xlabel('x - pos (in)')
ylabel('in')
zlabel('in')
