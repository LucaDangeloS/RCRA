#const n=3.
row(0..n-1).
col(0..n-1).
val(1..n).
% cell(c(R,C), V) :- row(R), col(C), val(V).

{black(X) : cell(X, _)}. %Choice de casillas, pueden ser negras o blancas 2^n posibles combinaciones
white(X, V) :- cell(X, V), not black(X).

adj(c(R,C), c(R,C+1)) :- cell(c(R,C),_), col(C+1). %Este es el predicado de las casillas adyacentes
adj(c(R,C), c(R+1,C)) :- cell(c(R,C),_), row(R+1).
adj(X,Y) :- adj(Y,X), X!=Y. %Si casilla a adyacente de b, b es adyacente de a tambien 

% Tablero de ejemplo
cell(c(0,0),2). cell(c(0,1),3). cell(c(0,2),1).
cell(c(1,0),1). cell(c(1,1),1). cell(c(1,2),1).
cell(c(2,0),1). cell(c(2,1),2). cell(c(2,2),3).
% cell(c(0,0),1). cell(c(0,1),1). cell(c(0,2),2). cell(c(0,3),1). cell(c(0,4),4). 
% cell(c(1,0),1). cell(c(1,1),5). cell(c(1,2),5). cell(c(1,3),4). cell(c(1,4),3). 
% cell(c(2,0),1). cell(c(2,1),4). cell(c(2,2),1). cell(c(2,3),3). cell(c(2,4),2). 
% cell(c(3,0),2). cell(c(3,1),5). cell(c(3,2),3). cell(c(3,3),3). cell(c(3,4),5). 
% cell(c(4,0),4). cell(c(4,1),2). cell(c(4,2),5). cell(c(4,3),1). cell(c(4,4),1). 

% Restricciones
:- black(X), black(Y), adj(X, Y). %Las casillas negras no pueden ser adyacentes
:- white(c(X,Y), V), white(c(X,Y'), V), Y!=Y'. %Restriccion de no tener el mismo numero en la misma columna
:- white(c(X,Y), V), white(c(X',Y), V), X!=X'. %Restriccion de no tener el mismo numero en la misma fila
:- cell(X, _), cell(Y, _), adj(X, Y), white(Y, _), white(X, _). %Las casillas blancas no puden quedarse aisladas

#show black/1.
% #show white/2.
% #show cell/2.