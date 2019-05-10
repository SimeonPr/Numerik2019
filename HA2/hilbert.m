function [hilbertN] = hilbert(n)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
hilbertN = zeros(n);
for i = 1:n
    for j = 1:n
        hilbertN(i,j)= 1/(i+j-1);
    end
end


