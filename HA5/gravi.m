function [f] = gravi(y)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
global gamma
global m1
global m2
f = [y(:,3) y(:,4) (gamma*m2)*(y(:,2)-y(:,1))/(norm(y(:,2)-y(:,1)))^3 gamma*(m1)*(y(:,1)-y(:,2))/(norm(y(:,1)-y(:,2)))^3];
end

