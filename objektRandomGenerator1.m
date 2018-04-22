function [objekterListe] = objektRandomGenerator1(antallObjekter, omraadeXY)

    %Finner antall dimensjoner
    midSize = size(omraadeXY);
    antallDimensjoner = midSize(1);


    objekterListe=objekt.empty(0);
    
    for i=1:antallObjekter
        midObj = objekt();
        
        %Lager massen
        midObj.masse=1;
        
        %lager fart
        v=zeros(1, antallDimensjoner);
        midObj.v=v;
        
        %Lager random posisjon
        pos = omraadeXY(:,1)   +  rand([1 antallDimensjoner])'.*(omraadeXY(:,2)-omraadeXY(:,1));
        pos=pos';
        midObj.pos=pos;
        
        %lagrer verdien i listen
        objekterListe(i)=midObj;
        
    end
end

