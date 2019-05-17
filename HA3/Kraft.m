function [F] = Kraft(a,s,l,x)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
F = s*((l/norm(x-a))-1).*(x-a);
end

