% Ejemplo de las la damas y dos tigre en las puertas
1 {d1; d2; d3} 1.     % Limitar a solo 1 dama, al menos 1 y como mucha 1
0 {p1; p2; p3} 1.   % Limitar cardinalidad del conjunto, como mucho 1 puerta es cierta

% p1 <-> ¬d1
% p1 -> ¬d1
:- p1, d1.
% ¬d1 -> p1
:- not d1, not p1.

% p2 <-> d2
:- p2, not d2.
:- d2, not p2.

% p3 <-> ¬d2
:- p3, d2.
:- not d2, not p3.

