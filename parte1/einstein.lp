house(1..5).
%person(brit;swede;dane;norw;german).
%color(red;green;white,blue;yellow).
%drink(water;tea;beer;milk;coffee).
%tobaco(prince;pall;blends;dumhill;bluem).
%pet(fish;horse;dog;bird;cat).

%1 { at(P,X): house(X) } 1 :- person(P).     %Para cada persona tiene una ca     Habla de preguntas de examen, mirar la grabacion 25/2
%:- at(P,X), at(P',X), P!=P'.

%1 { painted(C,X): house(X) } 1 :- color(C).
%:- painted(C,X), painted(C',X), C!=C'.

%LO DE ARRIBA ES LO MISMO QUE LO DE ABAJO

type(person,(brit;swede;dane;norw;german)).
type(color,(red;green;white;blue;yellow)).
type(drink,(water;tea;beer;milk;coffee)).
type(tobaco,(prince;pall;blends;dumhill;bluem)).
type(pet,(fish;horse;dog;bird;cat)).

1 { at(T,V ,X): house(X) } 1 :- type(T,V).     %Para cada persona tiene una ca     Habla de preguntas de examen, mirar la grabacion 25/2
:- at(T,V,X), at(T,V',X), V!=V'.

:- at(person,brit,X), not at(color, red, X).
:- at(person,swede,X), not at(pet, dog, X).
:- at(person,dane,X), not at(drink, tea, X).
:- at(color,white,X), not at(color, green, X-1).
:- at(color,green,X), not at(drink, coffee, X).
:- at(tobaco, pall,X), not at(pet, bird, X).
:- at(color,yellow,X), not at(tobaco, dumhill, X).
at(drink, milk, 3).
at(person, norw, 1).
:- at(tobaco, blends, X), not at (pet, cat,X-1), not at(pet, cat, X+1).
:- at(pet, horse, X), not at (tobaco, dumhill,X-1), not at(tobaco, dumhill, X+1).
:- at(tobaco,bluem,X), not at(drink, beer, X).
:- at(person,german,X), not at(tobaco, prince, X).
:- at(person,norw,X), not at(color, blue, X-1), not at(color, blue, X-1).
:- at(tobaco,blends,X), not at(drink, water, X-1), not at(drink, water, X-1).

#show at/3.


%%%ALGO COPIE MAL -> ME DEVUELVE 0 SOLUCIONES Y DEBE HABER 1