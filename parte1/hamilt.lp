vtx(1). vtx(2). vtx(3). vtx(4).
edge(1,2). edge(2,3). edge(2,4).
edge(3,1). edge(3,4). edge(4,3). edge(4,1).

{in (X,Y)} :- edge(X,Y).
:- in(X,Y), in(X,Y'), Y!=Y'.
:- in(X,Y), in(X',Y), X!=X'.

%connect(X,Y) :- in(X,Y).
%connect(X,Z) :- connect(X,Y), in(Y, Z).
%:- not connect (X,Y), vtx(X), vtx(Y).

connect(Y) :- in(1,Y).
connect(Z) :- connect(Y), in(Y, Z).
:- not connect (X), vtx(X).

#show in/2.
#show connect/2.
