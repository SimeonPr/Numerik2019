function [] = doppelstern(M1,M2,x1,x2,p,h)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
global gamma
global m1
global m2
m2=M2;
m1=M1;
gamma=1;
v1 = [0;p/m1];
v2 = [0;-p/m2];
y = [x1 x2 v1 v2];
clf
while true
    %clf
    hold on
    axis([-5 5 -5 5]);
    plot(y(1,1),y(2,1),'bo',y(1,2),y(2,2),'ro');
    pbaspect([1 1 1]);
    drawnow limitrate
    y = rukuschritt(@gravi,y,h);
    
end
end

