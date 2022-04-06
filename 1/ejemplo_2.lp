% Ejemplo de la dama y el tigre en las puertas.

{p1; p2; d1; d2}.

% p1 <-> (d1 /\ ¬d2)
% p1 -> d1 /\ ¬d2
% p1 -> d1

:- p1 , not d1.
:- p1, d2.
:- d1, not d2, not p1.


% p2 <-> (d1 /\ ¬d2) V (d2 /\ ¬d2)
% p2 <-> d1 xor d2
% (d1 V d2) /\ (¬d1 V ¬d2)

% p2 -> d1 xor d2
% p2 -> (d1 /\ ¬d2) V (d2 /\ ¬d2)
:- p2, not d1, not d2.

% p2 -> d1 V d2
% p2 -> ¬d1 V ¬d2
:- p2, d1, d2.

% d1 xor d2 -> p2
:- d1, not d2, not p2.

% (d1 /\ ¬d2) V (d2 /\ ¬d2) -> p2
% d1 /\ ¬d2 -> p2
:- d2, not d1, not p2.

% p1 xor p2
% (p1 /\ ¬p2) V (p1 /\ ¬p2)
:- p1, p2.
:- not p1, not p2.

% :1 {p1; p2} 1. Genera subconjuntos mayores/igual y menores/igual a 1 elemento.
% :2 {a; b; c; d; e} 4. De 2 a 4.
