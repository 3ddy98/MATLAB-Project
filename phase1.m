function [max_def] = phase1(a,b,h,E,v,q0,x0,y0,P,d,selection)
%
D=(E*h^3)/(12*(1-v^2));

switch(selection)
    case 1 %square
        x = 0:1:a;
        y = 0:1:b;
        [X,Y] = meshgrid(x,y);
        Wc = [zeros(size(X))];
        Wd = [zeros(size(X))];

        if q~= 0
            %deflection distributed rectangular
            series_multiplier_distributed= (16*q0)/(pi^6*D);
            for m= 1:2:19
              for n = 1:2:19

                Wd = Wd + (series_multiplier_distributed).*(sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b))./((m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2);

              end
            end
            max_distributed_rectangular = max(max(Wd));
            disp(s)
            %contour(X,Y,Wd)
            %surf(x,Y,Wd)
            xlabel('x - pos (in)')
            ylabel('y - pos (in)')
            zlabel('Deflection (in)')
        end

        if P ~= 0
            %deflection point rectangular
            for m = 1:1:10
                for n = 1:1:10
                    Wc = Wc + ((4*P)/((pi^4)*a*b*D)).*(((sin((m.*pi.*x0)./a).*sin((n.*pi.*y0)./b))./(((m^2/a^2)+(n^2/b^2))^2)).*sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b));
                end
            end
            max_point_rectangular = max(max(Wc));
            disp(s)
            %surf(X,Y,Wc)
            %contour(X,Y,Wc)
            xlabel('x - pos (in)')
            ylabel('in')
            zlabel('in')

        end

          W = Wc + Wd;
          max_def=max(max(W));
          countour(X,Y,W);

    case 2  %circular

        a = d/2;
        r = 0:.5:a;
        theta = 0:pi/24:2*pi;
        [R, THETA] = meshgrid(r,theta);
        Wd=[zeros(size(r))];
        Wc=[zeros(size(r))];


        if q0 ~= 0
          %Distributed Deflection Circular Plate
          Wd=((q0.*(a.^2-R.*2))./(64.*D)).*(((5+v)./(1+v)).*a.^2-R.^2);
        end
        if P~=0
          %Point Deflection Circular Plate
          Wc=(P)./(16.*pi.*D).*(((3+v)./(1+v)).*(a.^2-R.^2)+2.*R.^2.*log(R./a));
        end

        W = Wd + Wc;
        max_def = max(max(W));
        X = R.*cos(THETA);
        Y = R.*sin(THETA);
        contour(X,Y,W);
end
