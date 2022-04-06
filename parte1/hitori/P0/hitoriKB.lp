%Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
row(0..n-1).
col(0..n-1).
val(1..n).

{black(X) : cell(X, V)}. %Choice de casillas negras
white(X, V) :- cell(X, V), not black(X). % Casillas blancas

% Definición de casillas adyacentes
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
% Al igual que en el problema del grafo hamiltoniano, se elige una casilla
%  inicial para que esté conectada.
% Debido a la definición del problema, las casillas 0,1 y 0,0 no pueden ser negras, por 
% lo que al menos una de ellas será blanca.
connected(c(0,0), c(0,0)) :- white(c(0,0),_).
connected(c(0,1), c(0,1)) :- white(c(0,1),_).
connected(X, Z) :- white(X, _), adj(X, Y), connected(Y, Z), X!=Z.
:- white(X, _), not connected(X, _).

#show black/1.
#show white/2.
