function [ wei ] = lat( x,y,t )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    pi=3.1415926;
    wei=180*asin(y/x./t*15/180*pi)/pi;

end

