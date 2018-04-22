function [nyY] = ettStegRK(c,A,b,y,t,h,yDerivert)
%ETTSTEGRK Summary of this function goes here
%   Detailed explanation goes here
    antallElementer = length(y);
    %Finner ksi
    antallKsi=length(c);
    ksi = zeros(antallElementer,antallKsi);
    
    for v=1:antallKsi
        sum=zeros(antallElementer,1);
        for i=1:v-1
            sum=sum+(A(v,i).*yDerivert(t+c(i)*h,ksi(:,i)));
        end
        ksi(:,v) = y + sum*h;
    end
    
    %Finner ny y
    sum=zeros(antallElementer,1);
    for i=1:antallKsi
        sum=sum + (b(i).*yDerivert(t + c(i)*h,ksi(:,i)));
    end
    nyY= y + sum*h;

end

