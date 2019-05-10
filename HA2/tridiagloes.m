function [outputArg1,outputArg2] = tridiagloes(a,b,f)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
dim = size(a,1);
b(dim,:) = [0];
c = zeros(dim,1);
d = zeros(dim,1);
temp = 0;
for i = 1:dim
    c(i) = root(a(i)-temp);
    d(i) = b(i)/c(i);
    temp = temp + d(i)^2;
end
d(dim,:) = [];

end

