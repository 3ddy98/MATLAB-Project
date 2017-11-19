%Project
%Edward Ponce

%input x dimension
a = input('');
%input y dimension
b = input('');
%input thickness
h = input('');
%input load
P = input('');
%input x_o location of load
x_o = input('');
%input y_o location of load
y_o = input('');

%input Elastic Modulus
E = input('');
%input Poisson Ratio
v = input('');

%-----------Calculations-----------%
%----------------------------------%
%calculate D for 
D=(E*h^3)/(12*(1-v^2));
%Initialize the function multiplying the series
series_multiplier = (4*P)/(pi^4*a*b*D);
Q = summation(m,n,x_o,y_o,a,b)
%initialize function into sub-calculations

%testing


