%Practica - Hitori       Kevin Millán y Luca D'angelo

cell(Y,X):- values(Y,X,A).

r(Y1,X):- values(Y1,X,A),values(Y2,X,A),Y2 != Y1, not r(Y2,X).
r(Y,X1):- values(Y,X1,A),values(Y,X2,A),X2 != X1, not r(Y,X2).

:-not r(Y1,X), not r(Y2,X), values(Y1,X,A), values(Y2,X,A), Y1!=Y2.
 %selecting atleaast one from a list of items in a colum in they are similar
:- not r(Y,X1), not r(Y,X2), values(Y,X1,A), values(Y,X2,A), X1!=X2.
 %selecting atleaast one from a list of items in a colum in they are similar

:- r(Y,X), r(Y,X1),neighbor(Y,X,Y,X1),cell(Y,X),cell(Y,X1),X!=X1.
 
:- r(Y1,X), r(Y,X),neighbor(Y1,X,Y,X),cell(Y1,X),cell(Y,X),Y!=Y1.
 
neighbor(Y,X,Y,X1) :- cell(Y,X),cell(Y,X1),X1=X+1.
%checking if the cells are adjacent
neighbor(Y,X,Y,X1) :- cell(Y,X),cell(Y,X1),X1=X-1.

neighbor(Y,X,Y1,X) :- cell(Y,X),cell(Y1,X),Y1=Y+1.
%checking if the cells are adjacent
neighbor(Y,X,Y1,X) :- cell(Y,X),cell(Y-1,X),Y1=Y-1.
#show r/2.