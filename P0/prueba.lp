#const n=3.
row(0..n-1).
col(0..n-1).
val(1..n).
cell(c(R,C), V) :- row(R), col(C), val(V).

{black(X) : cell(X, _)} . %Choice de casillas, pueden ser negras o blancas 2^n posibles combinaciones


adj(c(R,C), c(R,C+1)) :- cell(c(R,C),_), col(C+1).    %Este es el predicado de las casillas adyacentes
adj(c(R,C), c(R+1,C)) :- cell(c(R,C),_), row(R+1).
adj(X,Y) :- adj(Y,X), X!=Y.                             %Si casilla a adyacente de b, b es adyacente de a tambien 

%   Tablero de ejemplo
cell(c(0,0),2). cell(c(0,1),3). cell(c(0,2),1). 
cell(c(1,0),1). cell(c(1,1),1). cell(c(1,2),1). 
cell(c(2,0),1). cell(c(2,1),2). cell(c(2,2),3). 

%Restricciones
:- black(X), black(Y), adj(X, Y). %Las casillas negras no pueden ser adyacentes
% 1 {cell(X,Y,V): val(V)} 1 :- col(X), row(Y).
% :- cell(c(X,Y), V), cell(c(X,Y'), V), not black(c(X,Y)), Y!=Y'.    %Restriccion de no tener el mismo numero en la misma columna
% :- cell(c(X,Y), V), cell(c(X',Y), V), not black(c(X,Y)), X!=X'.    %Restriccion de no tener el mismo numero en la misma fila
#show black/1.
#show cell/2.