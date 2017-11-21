%Project
%Edward Ponce Alex Barth Peter Frazier
%% Input
fprintf('What type of calculation?');
fprintf('[1] Rectangular');
fprintf('[2] Circular');
selection_1 = input('Selection: ');
switch(selection_1)
    case 1
        a = input('a:');    %width
        b = input('b:');    %length
        h = input('H:');    %thickness
        E = input('E: ');   %Elastic Modulus
        v = input('v: ');   %Poisson Ratio
        D=(E*h^3)/(12*(1-v^2));
        x = 0:1:a;          %x
        y = 0:1:b;          %y
        fprintf('-------Rectangular-------')
        fprintf('[1] Point Load Rectangular\n');
        fprintf('[2] Distributed load Rectangular\n\n');
        fprintf('[3] Both Rectangular\n');
        selection_2 = input('Selection: ');
        switch(selection_2)
            case 1
                x0 = input('x0: ');
                y0 = input('y0: ');
                P  = input('P: ');
                max_point_rectangular = deflection_point_rectangular(x0,y0,a,b,x,y,P,D);
            case 2
                q0 = input('q0: ');
                max_distributed_rectangular = deflection_distributed_rectangular(a,b,x,y,q0,D);
            case 3
                x0 = input('x0: ');
                y0 = input('y0: ');
                P  = input('P : ');
                q0 = input('q0: ');
                max_both_rectangular = both_distributed_rectangular(x0,y0,a,b,x,y,h,E,v,q0,P);
        end
        
    case 2
        d = input('d: ');   %diameter
        h = input('H: ');   %height
        E = input('E: ');   %Elastic Modulus
        v = input('v: ');   %Poisson Ratio
        D=(E*h^3)/(12*(1-v^2));
        fprintf('=======Circular=======');
        fprintf('[4] Point Load Circular\n');
        fprintf('[5] Distributed Load Rectangular\n');
        fprintf('[6] Both Circular\n');
        selection_2 = input('Selection:');
        switch(selection_2)
            case 1
                x0 = input('x0: ');
                y0 = input('y0: ');
                P  = input('P: ');
                max_point_circular = deflection_point_rectangular(x0,y0,a,b,x,y,P,D);
            case 2
                q0 = input('q0: ');
                max_distributed_circular = deflection_distributed_rectangular(a,b,x,y,q0,D);
            case 3
                x0 = input('x0: ');
                y0 = input('y0: ');
                P  = input('P : ');
                q0 = input('q0: ');
                max_both_circular = both_distributed_rectangular(x0,y0,a,b,x,y,h,E,v,q0,P);
        end

        
end

%-----------Calculations-----------%
%----------------------------------%
%calculate D for
D=(E*h^3)/(12*(1-v^2));
disp(D)
%% Start of Selection
%Initialize the function multiplying the series

selection_2 = input('Selection:');

switch(selection_2)
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
