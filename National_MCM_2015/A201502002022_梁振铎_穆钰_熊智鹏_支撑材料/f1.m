function [ f ] = f1( t )
    delta=-11.0403;
    phi=39.907222222222;
    f=sin(phi)*sin(delta)+cos(phi)*cos(delta)*cos(t);
end

