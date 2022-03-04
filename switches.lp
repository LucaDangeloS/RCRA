#program always.
switch(1..3).
action(tog(X)) :- switch(X).

#program dynamic.
% h(F,V) = el fuente F tiene el valor V
% o(A) = la accion de A ha ocurrido

%   Axiomas de efecto
h(sw(X), down) :- o(tog(X)), 'h(sw(X),up).
h(sw(X), up) :- o(tog(X)), 'h(sw(X),down).
h(light, off) :- o(tog(_)), 'h(light,on).
h(light, on) :- o(tog(_)), 'h(light,off).
%Inercia
h(sw(X), V) :- 'h(sw(X), V), not o(tog(X)).
cambio(F) :- 'h(F,V), h(F,W), V!=W.


#program initial.
h(sw(1), up), h(sw(2), down), h(sw(3), up).

&tel {
        &true
    ;> o(tog(2))
    ;> o(tog(3))
}.