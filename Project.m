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

fprintf('[1] Point Load Rectangular\n');
fprintf('[2] Distributed load Rectangular\n\n');
fprintf('[3] Both Rectangular\n');
fprintf('=======Circular=======');
fprintf('[4] Point Load Circular\n');
fprintf('[5] Distributed Load Rectangular\n');
fprintf('[6] Both Circular\n');
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
        q0 = input('qo:'); %distributed load
        y = deflection_distributed(a,b,x,y,q0,D);
        %fprintf('Deflection: %.5g\n',y);
    case 3
        q0=input('q0:');
        y = both_distributed
        
    case 4
        
    case 5
        
    case 6

    otherwise
        fprintf('Sorry that is not an option');
        return;
end
