function [F_strich] = KraftAbleitung(a,s,l,x)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
I = eye(2);
F_strich = s*(((l/norm(x-a))-1)*I-l.*((x-a)*(x-a)'/norm(x-a)^3));
end

