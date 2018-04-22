function [yDerivert] = yDerivertLager(t,y,masser,g)
    
    antallObjekter=length(masser);
    yDerivert=zeros(length(y),1);
    
    f2= @(x1,x2,m,g) (x2-x1).*(g*m./((norm(x2-x1)^3)));
    
    for i=1:antallObjekter
        %Fikser akselerasjonen
        sumA=zeros(3,1);
        midYpos=y((i-1)*6+4:(i-1)*6+6);
        %Går igjennom alle de andre objektene
        for m=1:antallObjekter
            if i~=m
                sumA=sumA+f2(midYpos,y((m-1)*6+4:(m-1)*6+6),masser(m),g);
            end
        end
        yDerivert((i-1)*6+1:(i-1)*6+3)=sumA;
        
        %Fikser farten
        
        yDerivert((i-1)*6+4:(i-1)*6+6)=y((i-1)*6+1:(i-1)*6+3);
    end
end

