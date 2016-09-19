y0=870;
x0=880;
sticklen =677.3906;
shadowlen=zeros(1,40);
sine=zeros(1,40);
for i=2:39
    dx=topx(i)-x0;
    if dx<0
        dx=dx*(-1);
    end
    dy=topy(i)-y0;
    if dy <0
        dy=dy*(-1);
    end
    shadowlen(i)=sqrt(dx*dy+dy*dy);
    sine(i)=dx/shadowlen(i);
    shadowlen(i)=shadowlen(i)/sticklen*2;
end