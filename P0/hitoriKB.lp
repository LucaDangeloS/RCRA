%Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
row(0..n-1).
col(0..n-1).
val(1..n).

repeated(c(X,Y), V) :- cell(c(X, Y),V), cell(c(X,Y'), V), Y!=Y'.
repeated(c(X,Y), V) :- cell(c(X, Y),V), cell(c(X',Y), V), X!=X'.
white(X, V) :- cell(X, V), not black(X).
{black(X) : repeated(X, _)}. %Choice de casillas, pueden ser negras o blancas 2^n posibles combinaciones

adj(c(R,C), c(R,C+1)) :- cell(c(R,C),_), col(C+1). %Este es el predicado de las casillas adyacentes
adj(c(R,C), c(R+1,C)) :- cell(c(R,C),_), row(R+1).
adj(X,Y) :- adj(Y,X), X!=Y. %Si casilla a adyacente de b, b es adyacente de a tambien 



% Recibe el tablero mediante un input, del decode.py

% Restricciones
:- black(X), black(Y), adj(X, Y). %Las casillas negras no pueden ser adyacentes
:- white(c(X,Y), V), white(c(X,Y'), V), Y!=Y'. %Restriccion de no tener el mismo numero en la misma columna
:- white(c(X,Y), V), white(c(X',Y), V), X!=X'. %Restriccion de no tener el mismo numero en la misma fila
% :- cell(c(X,Y),V), black(c(X,Y)), 
% :- black(c(X,Y)), cell(c(X,Y),V), white(c(X',Y), V), X!=X'.
% :- black(c(X,Y)), cell(c(X,Y),V), white(c(X,Y'), V), Y!=Y'.
connected(X, Y) :- white(X, _), white(Y, _), adj(X, Y). % Casillas blancas tienen que estar unidas
connected(X, Z) :- white(X, _), adj(X, Y), connected(Y, Z), X!=Z.
:- white(X, _), not connected(X, _).


#show black/1.
% #show repeated/2.
#show white/2.
