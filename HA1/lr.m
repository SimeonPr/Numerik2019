function [L,R] = lr(A)
%LR-Zerlegung
%   Macht aus A eine LR-Zerlegung

d = size(A,1);
L = eye(d);
R = A;
for j = 1:d
    for i = (j+1):d
        L(i,j) = R(i,j)/R(j,j);
        R(i,:) = R(i,:) - (R(i,j)/R(j,j))*R(j,:);
    end
end
end

