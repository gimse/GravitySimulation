clear;
clc;
close all;


%---------------------------------------
%Lager objektene som skal brukes (Variabler)

%Antall objekter
antallObjekter=40;

%Omraade objektene skal vaere
omraade= [1 9; 
          1 9;
          1 9];
tegneOmraade=[0 10; 
          0 10;
          0 10+1];
      
%Lager objektene
mineObj = objektRandomGenerator1(antallObjekter, omraade);

%Gravitasjons kost
g=2;

%Miste avstanden før akserasjonen blir null
minAvstand=0.20;

%---------------------------------------
%Lager objektene som skal brukes (Statiske)

%Finner y0
y0=finnY0(mineObj);

%Henter massene
masser=zeros(1,antallObjekter);
for i=1:antallObjekter
    masser(i)=mineObj(i).masse;
end
%Lager den deriverte
%F = @(t,y) yDerivertLager(t,y,masser,g);
F = @(t,y) yDerivertLager2(t,y,masser,g,minAvstand);

%-------------------------------------
%Andre Variabler (mere om løsingen av systemet)

%t0
t0=0;
%t-verdien 
tSlutt=5;

framesISek=25;

%antallSteg
antallSteg=(tSlutt-t0)*framesISek;

%RK varibler
c=[0 1/2 1];
A=[0 0 0 ; 1/2 0 0 ;-1 2 0];
b=[1/6 2/3 1/6];


%-----------------------------------
%utregninger

h= (tSlutt-t0)/antallSteg;

antallElementer = length(y0);

yn = zeros(antallElementer, antallSteg+1);
yn(:,1)=y0;
tn = linspace(t0,tSlutt,antallSteg+1);

%Starter på stegene

for stegNummer = 1: antallSteg
    yn(:,stegNummer+1)=ettStegRK(c,A,b,yn(:,stegNummer),tn(stegNummer),h,F);
    %Skriver ut hvor langt du har kommet
    
    if rem(stegNummer,framesISek)==0
        disp(['Sek: ' num2str(stegNummer/framesISek)]);
    end

end

%--------------------------------
%Animerer resulatet
global tegnMere
tegnMere=true;
minFigur = figure('CloseRequestFcn',@stopDenJaevlaFunksjonen,'units','normalized','outerposition',[0 0 1 1],'Color',[0.8 0.8 0.8]);

%capture video
vid = VideoWriter('video.avi');
vid.FrameRate=framesISek;
open(vid);

%Variabler:
for i=1:antallSteg
    if tegnMere

        %Lager liste med x,y,z
        yPos=zeros(3,antallObjekter);
        for v=1:antallObjekter
            yPos(:,v)=yn((v-1)*6+4:(v-1)*6+6,i);
        end
        
        objekt1=scatter3(yPos(1,:),yPos(2,:),yPos(3,:),'o','red','MarkerEdgeColor','k',...
        'MarkerFaceColor',[0 .75 .75]);
        axis([tegneOmraade(1,1) tegneOmraade(1,2) tegneOmraade(2,1) tegneOmraade(2,2) tegneOmraade(3,1) tegneOmraade(3,2)]);
        view(-70.5000,60)
        frame = getframe(minFigur);
        writeVideo(vid,frame);
        %pause(h);
        delete(objekt1);
    end   
end

close(vid)