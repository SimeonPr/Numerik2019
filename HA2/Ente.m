function [] = Ente(A)
%Stellt Transformation von einer Ente durch Matrix A dar.
ente =[0 1 1 1.5 2.5 3 3 4 2 2 1 -3.7 -5 -4 -3 0;1 0 3.5 4 4 3.5 3 3 2 -1 -2 -2 1 0 1 1];
t = linspace(0,2*pi,1000);
kreis = [5*cos(t);5*sin(t)];
[U,S,V] = svd(A);
%Ausgangsbild
clf
subplot(1,4,1);
title('Ausgangsbild');
grid on;
hold on;
axis([-10 10 -10 10]);
plot(kreis(1,:),kreis(2,:));
plot(ente(1,:),ente(2,:));
pbaspect([1 1 1]);
%nach orth. Trafo. V^T
ente_orth = V.'*ente;
kreis_orth = V.'*kreis;
subplot(1,4,2);
title('nach orth. Trafo. V^T');
grid on;
hold on;
axis([-10 10 -10 10]);
plot(kreis_orth(1,:),kreis_orth(2,:));
plot(ente_orth(1,:),ente_orth(2,:));
pbaspect([1 1 1]);
%nach Streckung S
ente_sv = S*ente_orth;
kreis_sv = S*kreis_orth;
subplot(1,4,3);
title('nach Streckung S');
grid on;
hold on;
axis([-10 10 -10 10]);
plot(kreis_sv(1,:),kreis_sv(2,:));
plot(ente_sv(1,:),ente_sv(2,:));
pbaspect([1 1 1]);
%nach orth. Trafo. U
ente_usv = U*ente_sv;
kreis_usv = U*kreis_sv;
subplot(1,4,4);
title('nach orth. Trafo U');
grid on;
hold on;
axis([-10 10 -10 10]);
plot(kreis_usv(1,:),kreis_usv(2,:));
plot(ente_usv(1,:),ente_usv(2,:));
pbaspect([1 1 1]);