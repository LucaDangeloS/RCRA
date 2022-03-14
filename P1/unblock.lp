#program always.

n(-size..size).
sense(horizontal; vertical).
action(move(L, N)) :- block(L, S, SZ), n(N).

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
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X,_)), X+SZ+N > size.    % No salirse por abajo
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X,_)), X+N < 0.          % No salirse por arriba
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(_,Y)), Y+SZ+N > size.  % No salirse por la derecha
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(_,Y)), Y+N < 0.        % No salirse por la izquierda

:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(X, Y)), 'ocupado(L', X, Y..Y+N+SZ-1), L!=L', N>0.
:- o(move(L, N)), 'h(block(L, horizontal, SZ), c(X, Y)), 'ocupado(L', X, Y+N..Y), L!=L', N<0.
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X, Y)), 'ocupado(L', X..X+N+SZ-1, Y), L!=L', N>0.
:- o(move(L, N)), 'h(block(L, vertical, SZ), c(X, Y)), 'ocupado(L', X+N..X, Y), L!=L', N<0.

% fail if move is blocked
% :- blocked(t,X3,Y), stone(t-1,S,x,X1,Y,L), move(t,S,x,X2), X1 < X2, X1 + L <= X3, X3 < X2 + L.
% :- blocked(t,X3,Y), stone(t-1,S,x,X1,Y,_), move(t,S,x,X2), X2 < X1, X2     <= X3, X3 < X1.
% :- blocked(t,X,Y3), stone(t-1,S,y,X,Y1,L), move(t,S,y,Y2), Y1 < Y2, Y1 + L <= Y3, Y3 < Y2 + L.
% :- blocked(t,X,Y3), stone(t-1,S,y,X,Y1,_), move(t,S,y,Y2), Y2 < Y1, Y2     <= Y3, Y3 < Y1.

% #program initial. which applies only to the first state
% #program always. which applies to each state
% #program dynamic. which applies to all except the first state
% #program final. which applies only to the last state

% https://github.com/potassco/telingo

% #program initial.
% #const size=6.
% block(e, horizontal, 2).
% block(d, horizontal, 3).
% block(c, vertical, 2).
% block(b, horizontal, 2).
% block(a, vertical, 3).

% h(block(a, vertical, 3), c(0,3)).
% h(block(b, horizontal, 2), c(2,0)).
% h(block(c, vertical, 2), c(4,0)).
% h(block(d, horizontal, 3), c(4,2)).
% h(block(e, horizontal, 2), c(5,3)).

% &tel {
%     &true
%   ;> o(move(b, 1))
%   ;> o(move(c, -3))
% }.


%%Ejemplo 6

#program initial.
#const size=6.

block(g, horizontal, 2).
block(f, vertical,   2).
block(e, vertical,   2).
block(d, horizontal, 2).
block(c, vertical,   3).
block(b, vertical,   2).
block(a, vertical,   3).

h(block(g, horizontal, 2), c(4,2)).
h(block(f, vertical,   2), c(3,1)).
h(block(e, vertical,   2), c(2,3)).
h(block(d, horizontal, 2), c(2,0)).
h(block(c, vertical,   3), c(0,5)).
h(block(b, vertical,   2), c(0,3)).
h(block(a, vertical,   2), c(0,2)).

#program final.
goal :- h(block(d, horizontal, 2), c(2,4)).

#program final.
% goal :- h(block(b, horizontal, 2), c(2,4)).
:- not goal.


% #show h/2.
#show move/2.
% #show ocupado/3.