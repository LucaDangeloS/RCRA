digit(1..9).
row(0..8).
col(0..8).
%AQUI EMPIEZA LA INSTANCIA DEL SUDOKU cell(columna, fila, numero)       Se puede borrar y al usar clingo se pueden llamar a varios ficheros para unirlos
cell(2,0,6). cell(5,0,2).
cell(5,1,5).
cell(0,2,7). cell(4,2,9).
cell(1,3,3). cell(2,3,1). cell(4,3,8). cell(7,3,7).
cell(0,4,6). cell(8,4,8).
cell(1,5,2). cell(5,5,3). cell(7,5,4). cell(8,5,5).
cell(5,6,9). cell(6,6,3).
cell(1,7,7). cell(2,7,4). cell(1,7,7). cell(4,7,6). cell(7,7,2).
cell(0,8,9). cell(4,8,7).
%AQUI TERMINA LA INSTANCIA DEL SUDOKU
1 {cell(X,Y,D): digit(D)} 1 :- col(X), row(Y).
:- cell(X,Y,D), cell(X,Y',D), Y!=Y'.
:- cell(X,Y,D), cell(X',Y,D), X!=X'.
:- cell(X,Y,D), cell(X',Y',D), X!=X', Y!=Y', X/3=X'/3 , Y/3=Y'/3 .
#show cell/3.
