function [max_def] = phase1(a,b,h,E,v,q,x0,y0,P,d,selection,plot_type)
%phase1(width,length,height,Elastic Modulus,Poisson Ratio,Distributed Load,Load X, Load Y,Point Load,diameter,selection,plot_type)
%For plot_type: 1) contour 2) surf 3) 2D (only for circle)

D=(E*h^3)/(12*(1-v^2));

switch (selection)
    case 1 % Rectangular deflection

        % Setting values for variables
        x = 0:a/50:a;
        y = 0:b/50:b;
        % Creating a meshgrid to evaluate deflection on
        [X,Y] = meshgrid(x,y);
        Wc = zeros(size(X));
        Wd = zeros(size(X));

        if q~= 0
            %deflection distributed rectangular
            series_multiplier_distributed= (16*q)/(pi^6*D);
            for m= 1:2:19
              for n = 1:2:19

                Wd = Wd + (series_multiplier_distributed).*(sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b))./((m.*n).*((m.^2./a.^2)+(n.^2./b.^2)).^2);

              end
            end

        end

        if P ~= 0
            %deflection point rectangular
            for m = 1:1:10
                for n = 1:1:10
                    Wc = Wc + ((4*P)/((pi^4)*a*b*D)).*(((sin((m.*pi.*x0)./a).*sin((n.*pi.*y0)./b))./(((m^2/a^2)+(n^2/b^2))^2)).*sin((m.*pi.*X)./a).*sin((n.*pi.*Y)./b));
                end
            end

        end

          W = Wc + Wd;
          max_def=max(max(W));
          switch(plot_type)
          case 1
            contour(X,Y,W);
            xlabel('x - pos ')
            ylabel('y - pos ')
            zlabel('Deflection ')
            title({'Deflection of a Rectangular Plate';['Max Deflection = ',num2str(max_def)]})
          case 2
            surf(X,Y,W);
            xlabel('x - pos ')
            ylabel('y - pos ')
            zlabel('Deflection ')
            title({'Deflection of a Rectangular Plate';['Max Deflection = ',num2str(max_def)]})
          otherwise
            fprintf('Plot type selection does not exist\n')
            fprintf('Using contour as default plot\n')
            end

    case 2  %circular

        a = d/2;
        r = 0:a/50:a;
        theta = 0:pi/24:2*pi;
        [R, THETA] = meshgrid(r,theta);
        Wd=zeros(size(r));
        Wc=zeros(size(r));


        if q ~= 0
          %Distributed Deflection Circular Plate
          Wd=((q.*(a.^2-R.*2))./(64.*D)).*(((5+v)./(1+v)).*a.^2-R.^2);
        end
        if P~=0
          %Point Deflection Circular Plate
          Wc=(P)./(16.*pi.*D).*(((3+v)./(1+v)).*(a.^2-R.^2)+2.*R.^2.*log(R./a));
        end
        %Total deflection of a point and distributed load on a circular plate
        W = Wd + Wc;
        %Max deflection of the total deflection
        max_def = max(max(W));
        %convert to polar coordinates
        X = R.*cos(THETA);
        Y = R.*sin(THETA);

        %Plot Selection
        switch(plot_type)
        case 1
          contour(X,Y,W);
          xlabel('x - pos ')
          ylabel('y - pos ')
          zlabel('Deflection ')
          title({'Deflection of a Circular Plate';['Max Deflection = ',num2str(max_def)]})
        case 2
          surf(X,Y,W);
          xlabel('x - pos ')
          ylabel('y - pos ')
          zlabel('Deflection ')
          title({'Deflection of a Circular Plate';['Max Deflection = ',num2str(max_def)]})
        case 3
        plot(r,W);
        xlabel('Radius ')
        ylabel('Deflection')
        title({'Deflection of a Circular Plate';['Max Deflection = ',num2str(max_def)]})

        otherwise
          fprintf('Plot type selection does not exist\n')
          fprintf('Using surf as default plot\n')
          surf(X,Y,W);
        end

end
