%Project
%Edward Ponce Alex Barth Peter Frazier
%% Input
guide('something.fig');
while true
    fprintf('What type of calculation?\n');
    fprintf('[1] Rectangular\n');
    fprintf('[2] Circular\n');
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
            fprintf('-------Rectangular-------\n')
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
            fprintf('=======Circular=======\n');
            fprintf('[4] Point Load Circular\n');
            fprintf('[5] Distributed Load Rectangular\n');
            fprintf('[6] Both Circular\n');
            selection_2 = input('Selection:');
            switch(selection_2)
                case 1
                    x0 = input('x0: ');
                    y0 = input('y0: ');
                    P  = input('P: ');
                    max_point_circular = deflection_point_circle(d,h,E,v,P);
                case 2
                    q0 = input('q0: ');
                    max_distributed_circular = deflection_distributed_circle(d,h,E,v,q0);
                case 3
                    x0 = input('x0: ');
                    y0 = input('y0: ');
                    P  = input('P : ');
                    q0 = input('q0: ');
                    max_both_circular = both_distributed_circular(d,h,E,v,q);
                otherwise
                    fprintf('I''m sorry that was not an option please select again\n');
            end
        otherwise
            clc;
            fprintf('Error: I''m sorry that was not an option please select again\n\n');
    end
end
