function [wdc]= deflection_distributedC(d,h,E,v,q,R)



D=(E*h^3)/(12*(1-v^2));
a=d/2;
wdc=((q(a.^2-R.*2))./(64.*D)).*(((5+v)./(1+v)).*a.^2-R.^2);

end
