function [x_k] = regulafalsi(f, a, b, tol)
%Regula Falsi: Nullstellen bestimmen
%   
%Check Intervall
if ~((sign(f(a)) + sign(f(b)))==0)
    disp('Invalid intervall. ')
    return
end
%Set a to be smaller value
if b<a
    temp=b;
    b=a;
    a=temp;
end
%Iteration
while 1
    x_kminusone = a;
    x_k = (a*f(b)-b*f(a))/(f(b)-f(a));
    if sign(x_k) == sign(a)
        a = x_k;
    else 
        b = x_k;
    end
    if (abs(x_kminusone-x_k) < tol)
        break
    end
end
end

