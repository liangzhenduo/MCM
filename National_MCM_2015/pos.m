function [ wei ] = pos( pk,x,y,jin )
    pi=3.1415926;
    %delta=delta/180*pi;
    %tmp=(15*pk+lamda/pi*180-120+eo*15)/180*pi;
    %tuo=x./y*sin(delta)./tan(tmp)-cos(delta)*cos(tmp).*cos(phi);
    %l=sqrt((x*x+y*y)*tuo.*tuo/(1-tuo.*tuo));
    t=pk+(jin-120)/15+eot(660);
    wei=asin(y/x./tan(t*15/180*pi))/pi*180;
end

