function [y0] = finnY0(objekter)

    %Y er bygd opp med objektene samlet og starter med fart, og så pos.
    
    %finner dimensjonen ved å se på et av objektene
    dimensjon=length(objekter(1).pos);
    
    antallObjekter=length(objekter);
    
    %Finner legnden til y
    yLengde=antallObjekter*dimensjon*2;
    y0= zeros(yLengde,1);
    
    for i=1:antallObjekter
        %Legger til farten
        
        y0((i-1)*6+1:(i-1)*6+3)=(objekter(i).v)';
        %Legger til pos
        y0((i-1)*6+4:(i-1)*6+6)=(objekter(i).pos)';
        
    end
    

end

