function [nyY] = yDerivert(t,y)
    
    m=[ 2 1 ];
    g=20;
    f2= @(x1,x2,m,g) (x2-x1).*(g*m./((norm(x2-x1)^3)));

    nyY=zeros(8,1);
    

    
    nyY(1:2)=f2(y(3:4),y(7:8),m(2),g);
    nyY(3) = y(1);
    nyY(4) = y(2);
    nyY(5:6)=f2(y(7:8),y(3:4),m(1),g);
    nyY(7) = y(5);
    nyY(8) = y(6);
    

end

