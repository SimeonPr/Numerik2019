function [u] = tridiagloes(a,b,f)
%Tridiagonalmatrix Summary of this function goes here
%   L�sung von Au=f wobei A eine symmetrische positiv definite Tridiagonalmatrix ist. 
dim = size(a,1);
c = zeros(dim,1);
d = zeros(dim-1,1);

%F�r n=1
c(1)=sqrt(a(1));
d(1)=b(1)/c(1);
%F�r n=2...Dimension-1
for n = 2:(dim-1)
    c(n) = sqrt(a(n)-d(n-1)^2);
    d(n) = b(n)/c(n);
end
%F�r n=Dimension
c(dim)=sqrt(a(dim)-d(dim-1)^2);
%Ly=f l�sen:
y = zeros(dim,1);
%F�r n=1
y(1) = f(1)/c(1);
%F�r n=2...dim
for n=2:dim
    y(n)=(f(n)-y(n-1)*d(n-1))/(c(n));
end

%L(t)u=y l�sen:
u = zeros(dim,1);
%F�r n=dim
u(dim)=y(dim)/c(dim);
%F�r n=dim-1..1
for n=dim-1:-1:1
    u(n)=(y(n)-u(n+1)*d(n))/(c(n));
end

end

