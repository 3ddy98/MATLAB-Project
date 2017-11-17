function y = summation(m,n,x_o,y_o,a,b)

sin_xo_function = sin((m*pi*x_o)/a);
sin_yo_function = sin((n*pi*y_o)/b);
dividing_function = ((m^2/a^2)+(n^2/b^2))^2;
sin_x_function = sin((m*pi*x)/a);
sin_y_function = sin((n*pi*y)/b);
total_function =((sin_xo_function*sin_yo_function)/dividing_function)*(sin_x_function*sin_y_function);
for m = 1:10
    for n=1:10 
        Q = sum(total_function);
    end
end