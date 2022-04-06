% Ejemplo toggles y bombillas PARAMETRIZADO
% switch(a), switch(b), switch(c).
switch(a;b;c).
sit(0..1).

% {up(a,0); up(b,0); up(c,0); light(0)}.
% {up(a,1); up(b,1); up(c,1); light(1)}.
{up(X, I) : switch(X),sit(I); light(I) : sit(I)}.   % intensional (?)
1 {tog(X, 1) : switch(X)} 1 :- sit(I), I > 0.

% up(a,0) ^ tog(a,1) -> ¬ up(a,1)
:- up(X,0), tog(X,1), up(X,1).
:- not up(X,0), tog(X,1), not up(X,1).

% light(0) ^ tog1 -> ¬light(1)
:- light(0), tog(X,1), light(1).
:- not light(0), tog(X,1), not light(1).

% SUCCESOR STATE AXIOMS
% up(b,0) ^ ¬up(b,1) -> tog(b,1)
:- up(Y,0), tog(X,1), not up(Y,1), X != Y, I > 0.
:- not up(Y,0), tog(X,1), up(Y,1), X != Y, I > 0.

up(a,0). up(b,0). up(c,0).
light(0).
tog(a,1). tog(b,2). tog(a,3).

% Solo muestra los predicados que pongas. Nombre_ped/N_argumentos
#show tog/2.
#show light/1.