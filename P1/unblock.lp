type(sense,{horizontal ; vertical} ).
type(size, val(1..n)).
type(letter, digit(a..z)).


%Letter, (X Y), Size, Sense.
block(L, X, Y, SZ, S) :- .