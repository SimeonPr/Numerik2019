T = zeros(12,6);
for i = 1:12
    %Nötig Werte berechnen
    A = hilbert(i+1);
    
    x = zeros(i+1,1);
    x(1)=1;
    x(i+1)=1;
    
    b = A(:,1)+A(:,i+1);
    
    x_bs=A\b;
    
    [L,R,P] = lu(A);
    b_perm = P*b;
    y_lr = (b_perm\L).';
    x_lr = (y_lr\R).';
    
    R = chol(A);
    y_chol = (b\R.').';
    x_chol = (y_chol\R).';
    
    %Erste Spalte
    T(i,1) = i+1;
    %Zweite Spalte
    T(i,2) = cond(A,inf)*10^(-16);
    %Dritte Spalte
    T(i,3) = (norm(x-x_bs,inf))/(norm(x,inf));
    %Vierte Spalte
    T(i,4) = (norm(x-x_lr,inf))/(norm(x,inf));
    %Fünfte Spalte
    T(i,5) = (norm(x-x_chol,inf))/(norm(x,inf));
    %Sechste Spalte
    T(i,6) = norm(A*x_chol-b,inf);
end
disp(T)
