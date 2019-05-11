T = zeros(12,6);
for i = 1:12
    %Nötige Werte berechnen
    A = hilb(i+1);
    b = A(:,1)+A(:,i+1);
    x = zeros(i+1,1);
    x(1)=1;
    x(i+1)=1;
    normx=norm(x,inf);
    
    x_bs=A\b;
    
    [L,R,P] = lu(A);
    b_perm = P*b;
    y_lr = L\b_perm;
    x_lr = R\y_lr;
    
    R = chol(A);
    y_chol = R.'\b;
    x_chol = R\y_chol;
    
    %Erste Spalte: Zahlen n von 2 bis 13
    T(i,1) = i+1;
    %Zweite Spalte: Konditionszahlen der n-Hilbertmatrizen
    T(i,2) = cond(A,inf)*10^(-16);
    %Dritte Spalte: relative Fehler von x_bs
    T(i,3) = (norm(x-x_bs,inf))/(normx);
    %Vierte Spalte: relative Fehler von x_lr
    T(i,4) = (norm(x-x_lr,inf))/(normx);
    %Fünfte Spalte: relative Fehler von x_chol
    T(i,5) = (norm(x-x_chol,inf))/(normx);
    %Sechste Spalte: Probewert
    T(i,6) = norm(A*x_chol-b,inf);
end
disp(T)
