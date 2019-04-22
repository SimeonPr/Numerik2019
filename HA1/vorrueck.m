function [x] = vorrueck(L,R,b)
%Solve LRx=b
%   Löst LRx=b



%Get dim and initialize y, x
d = size(L,1);
y = zeros(d,1);
x = zeros(d,1);
%Solve Ly=b
for k = 1:d
    temp=0;
    for i = 1:(k-1)
        temp = temp + L(k,i)*y(i);
    end
    y(k) = (b(k) - temp)/L(k,k); 
end
%Solve Rx=y
for k = d:-1:1
    temp=0;
    for i = k+1:d
        temp = temp + R(k,i)*x(i);
    end
    x(k) = (y(k) - temp)/R(k,k); 
end

end

