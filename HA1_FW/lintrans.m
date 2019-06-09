function [] = lintrans(func,n,a,cfl)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
omega = linspace(0,10,n);
u_0_upwind = zeros(n,1);
for i=1:n
u_0_upwind(i)=func(omega(i));
end
u_0_laxf=u_0_upwind;
u_0_laxw=u_0_upwind;
u_1_upwind = zeros(n,1);
u_1_laxf = zeros(n,1);
u_1_laxw= zeros(n,1);
t = 0;
delta_x=10/n;
delta_t=cfl*delta_x/a;
clf
%randbedingungen
    links = 0;
    rechts = 0;
    u_1_upwind(1)=links;
    u_1_upwind(n)=rechts;
    u_1_laxf(1)=links;
    u_1_laxf(n)=rechts;
    u_1_laxw(1)=links;
    u_1_laxw(n)=rechts;
while (true)
    
    drawnow
    plot(omega,u_0_upwind,'b');
    hold on
    plot(omega,u_0_laxf,'r');
    plot(omega,u_0_laxw,'g');
    legend('upwind','laxf','laxw');
    hold off
    axis([0 10 -2 2]);
    t = t + delta_t;
    
    %rechenvorschrift
    
    for i=2:n-1
        u_1_upwind(i)=u_0_upwind(i)-((a+abs(a))/2)*cfl*(u_0_upwind(i)-u_0_upwind(i-1))-((a-abs(a))/2)*cfl*(u_0_upwind(i+1)-u_0_upwind(i));
    end
    for i=2:n-1
       u_1_laxf(i)=(u_0_laxf(i+1)+u_0_laxf(i-1))/2 - cfl/2*(u_0_laxf(i+1)-u_0_laxf(i-1));
    end
    for i=2:n-1
        u_1_laxw(i)=u_0_laxw(i) - (cfl/2)*(u_0_laxw(i+1)-u_0_laxw(i-1)) + ((cfl^2)/(2))*(u_0_laxw(i+1)-u_0_laxw(i)*2+u_0_laxw(i-1));
    end
    
    u_0_upwind=u_1_upwind;
    u_0_laxf=u_1_laxf;
    u_0_laxw=u_1_laxw;
end

