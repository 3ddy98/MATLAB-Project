%Project
%Edward Ponce Alex Barth Peter Frazier
%% Input
%input x dimension
a = input('a:');
%input y dimension
b = input('b:');
%input thickness
h = input('H:');

% x value
x = 0:1:a;
% y value
y = 0:1:b;

%input Elastic Modulus
E = input('E:');
%input Poisson Ratio
v = input('v:');

%-----------Calculations-----------%
%----------------------------------%
%calculate D for
D=(E*h^3)/(12*(1-v^2));
disp(D)
%% Start of Selection
%Initialize the function multiplying the series

fprintf('[1] Point Load\n');
fprintf('[2] Distributed load\n\n');
selection = input('Selection:');

switch(selection)
        case 1  %point load
        %input x_o location of load
        x_o = input('Xo:');
        %input y_o location of load
        y_o = input('Yo:');
        %input load
        P = input('P:');

        y = deflection(x_o,y_o,a,b,x,y,P,D);
        %fprintf('Deflection: %.5g\n',y);
    case 2
        qo = input('qo:'); %distributed load
        series_multiplier_distributed= (16*qo)/(pi^6*D);
        y = deflection_distributed(a,b,x,y,series_multiplier_distributed);
        %fprintf('Deflection: %.5g\n',y);

    otherwise
        fprintf('Sorry that is not an option');
        return;
end
