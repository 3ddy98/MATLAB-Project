function y = deflection(x_o,y_o,a,b)
syms m;
syms n;

n_array=[];     %Array for inside summation
m_array = [];   %Array for outside summation
for m = 1:10
    for n=1:10 
        sin_xo_function = sin((m*pi*x_o)/a);
        sin_yo_function = sin((n*pi*y_o)/b);
        dividing_function = ((m^2/a^2)+(n^2/b^2))^2;
        sin_x_function = sin((m*pi*a)/a);
        sin_y_function = sin((n*pi*b)/b);
        total_function =((sin_xo_function*sin_yo_function)/dividing_function)*(sin_x_function*sin_y_function);
        n_array = [n_array,total_function];
    end
    m_array = [m_array,sum(n_array)];
end
y = sum(m_array);