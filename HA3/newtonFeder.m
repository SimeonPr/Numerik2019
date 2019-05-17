function [x,F_ges] = newtonFeder(a1, s1, l1, a2, s2, l2, m , g, x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
G = [0;-m*g];
for i=1:10000
    F1=Kraft(a1,s1,l1,x);
    F2=Kraft(a2,s2,l2,x);
    F_ges = F1+F2+G;
    F_strich = KraftAbleitung(a1,s1,l1,x)+KraftAbleitung(a2,s2,l2,x);
    x = x - F_strich\F_ges;
end
end

