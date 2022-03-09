%Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
row(0..n-1).
col(0..n-1).
val(1..n).

repeated(c(X,Y), V) :- cell(c(X, Y),V), cell(c(X,Y'), V), Y!=Y'.
repeated(c(X,Y), V) :- cell(c(X, Y),V), cell(c(X',Y), V), X!=X'.
white(X, V) :- cell(X, V), not black(X).
{black(X) : repeated(X, _)}. %Choice de casillas negras

% Definición de casillas adjacentes
adj(c(R,C), c(R,C+1)) :- cell(c(R,C),_), col(C+1).
adj(c(R,C), c(R+1,C)) :- cell(c(R,C),_), row(R+1).
adj(X,Y) :- adj(Y,X), X!=Y.

% Recibe el tablero mediante un input de decode.py

% Restricciones
% Las casillas negras no pueden ser adyacentes
:- black(X), black(Y), adj(X, Y). 

% No puede haber dos casillas en blanco con el mismo número en la misma fila o columna
:- white(c(X,Y), V), white(c(X,Y'), V), Y!=Y'.
:- white(c(X,Y), V), white(c(X',Y), V), X!=X'.

% Todas las casillas blancas están conectadas entre si
connected(X, Y) :- white(X, _), white(Y, _), adj(X, Y).
connected(X, Z) :- white(X, _), adj(X, Y), connected(Y, Z), X!=Z.
:- white(X, _), not connected(X, _).

#show black/1.
#show white/2.
% #show repeated/2.
