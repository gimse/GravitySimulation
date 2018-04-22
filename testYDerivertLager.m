clear;
clc;

%Antall objekter
antallObjekter=3;

%Omraade objektene skal vaere
omraade= [0 10; 
          0 10;
          0 10];
%Lager objektene
mineObj = objektRandomGenerator1(antallObjekter, omraade);

%Gravitasjons
g=1;

%Finner y0
y0=finnY0(mineObj)

%Henter massene
masser=zeros(1,length(mineObj));
for i=1:length(mineObj)
    masser(i)=mineObj(i).masse;
end
%Lager den deriverte
F = @(t,y) yDerivertLager(t,y,masser,g);

F(0,y0)