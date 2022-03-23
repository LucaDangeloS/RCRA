% Luca D'angelo Sabin        Kevin Millán Canchapoma     Grupo: 3.1
#program always.

nh(-height..height).
nw(-width..width).
sense(horizontal; vertical).
action(move(L, N)) :- block(L, vertical, SZ), nh(N).
action(move(L, N)) :- block(L, horizontal, SZ), nw(N).

ocupado(L, X..X+SZ-1,Y) :- h(block(L, vertical, SZ), c(X,Y)).
ocupado(L, X,Y..Y+SZ-1) :- h(block(L, horizontal, SZ), c(X,Y)).

#program dynamic.
% Generacion de la siguiente acción
1 {o(A) : _action(A) } 1.

% Axiomas de efecto
h(block(L, vertical, SZ), c(X+N,Y))  :- o(move(L, N)), 'h(block(L, vertical, SZ), c(X,Y)).      % Mover un bloque verticalmente
h(block(L, horizontal, SZ), c(X,Y+N))  :- o(move(L, N)), 'h(block(L, horizontal, SZ), c(X,Y)).  % Mover un bloque horizontalmente

% Inercia
h(block(L, S, SZ) , c(X,Y)) :- 'h(block(L, S, SZ), c(X,Y)), not o(move(L, _)). % Estado no cambia si no se mueve bloque
move(L, N) :- o(move(L, N)). % Definición de movimientos

% Limitaciones de tablero
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X,_)), X+SZ+N > height.    % No salirse por abajo
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X,_)), X+N < 0.          % No salirse por arriba
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(_,Y)), Y+SZ+N > width.  % No salirse por la derecha
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(_,Y)), Y+N < 0.        % No salirse por la izquierda

% Limitaciones entre bloques
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(X, Y)), 'ocupado(L', X, Y..Y+N+SZ-1), L!=L', N>0.
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(X, Y)), 'ocupado(L', X, Y+N..Y), L!=L', N<0.
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X, Y)), 'ocupado(L', X..X+N+SZ-1, Y), L!=L', N>0.
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X, Y)), 'ocupado(L', X+N..X, Y), L!=L', N<0.

#program final.
:- not goal.

#show move/2.