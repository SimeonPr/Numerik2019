function [y_neu] = rukuschritt(f,y,h)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
b=[1/6 1/3 1/3 1/6];
a=[0 0 0 0;1/2 0 0 0;0 1/2 0 0;0 0 1 0];
y_neu=y;
k = zeros(size(y,1),size(y,2),4);
for i=1:4
    sum=zeros(size(y,1),size(y,2));
    for j=1:4
        sum=sum+a(i,j)*k(:,:,j);
    end
   k(:,:,i)=f(y+h*(sum)); 
end

for i=1:4
y_neu=y_neu+h*(b(1,i)*k(:,:,i));
end

