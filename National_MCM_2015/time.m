function [ ti ] = time( l,t,n )
    st=t+(l-120)/15+eot(n);
    w=(st-12)*15;
    ti=w/180*3.1415926;
end

