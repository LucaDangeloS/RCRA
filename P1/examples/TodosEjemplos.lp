%%Ejemplo 1

#program initial.
#const size=6.
block(e, horizontal, 2).
block(d, horizontal, 3).
block(c, vertical, 2).
block(b, horizontal, 2).
block(a, vertical, 3).

h(block(a, vertical, 3), c(0,3)).
h(block(b, horizontal, 2), c(2,0)).
h(block(c, vertical, 2), c(4,0)).
h(block(d, horizontal, 3), c(4,2)).
h(block(e, horizontal, 2), c(5,3)).

#program final.
goal :- h(block(b, horizontal, 2), c(2,4)).


%%Ejemplo 2

#program initial.
#const size=6.
block(h, horizontal, 3).
block(g, horizontal, 2).
block(f, vertical,   2).
block(e, vertical,   3).
block(d, horizontal, 2).
block(c, vertical,   3).
block(b, vertical,   3).
block(a, horizontal, 2).

h(block(h, horizontal, 3), c(5,2)).
h(block(g, horizontal, 2), c(4,4)).
h(block(f, vertical,   2), c(4,0)).
h(block(e, vertical,   3), c(1,3)).
h(block(d, horizontal, 2), c(2,1)).
h(block(c, vertical,   3), c(1,0)).
h(block(b, vertical,   3), c(0,5)).
h(block(a, horizontal, 2), c(0,0)).

#program final.
goal :- h(block(d, horizontal, 2), c(2,4)).

%%Ejemplo 3

#program initial.
#const size=6.
block(l, horizontal, 2).
block(k, vertical,   2).
block(j, vertical,   2).
block(i, vertical,   2).
block(h, vertical,   3).
block(g, vertical,   2).
block(f, horizontal, 2).
block(e, horizontal, 3).
block(d, horizontal, 3).
block(c, vertical,   2).
block(b, vertical,   2).
block(a, vertical,   2).

h(block(l, horizontal, 2), c(5,0)).
h(block(k, vertical,   2), c(4,5)).
h(block(j, vertical,   2), c(3,0)).
h(block(i, vertical,   2), c(2,5)).
h(block(h, vertical,   3), c(2,3)).
h(block(g, vertical,   2), c(2,2)).
h(block(f, horizontal, 2), c(2,0)).
h(block(e, horizontal, 3), c(1,3)).
h(block(d, horizontal, 3), c(0,3)).
h(block(c, vertical,   2), c(0,2)).
h(block(b, vertical,   2), c(0,1)).
h(block(a, vertical,   2), c(0,0)).

#program final.
goal :- h(block(f, horizontal, 2), c(2,4)).

%%Ejemplo 4

#program initial.
#const size=6.

block(k, horizontal, 2).
block(j, horizontal, 2).
block(i, horizontal, 2).
block(h, vertical,   2).
block(g, horizontal, 3).
block(f, vertical,   2).
block(e, horizontal, 2).
block(d, vertical,   3).
block(c, vertical,   2).
block(b, horizontal, 3).
block(a, vertical,   2).

h(block(k, horizontal, 2), c(5,3)).
h(block(j, horizontal, 2), c(5,0)).
h(block(i, horizontal, 2), c(4,4)).
h(block(h, vertical,   2), c(4,2)).
h(block(g, horizontal, 3), c(3,0)).
h(block(f, vertical,   2), c(2,4)).
h(block(e, horizontal, 2), c(2,0)).
h(block(d, vertical,   3), c(1,5)).
h(block(c, vertical,   2), c(1,3)).
h(block(b, horizontal, 3), c(0,3)).
h(block(a, vertical,   2), c(0,0)).

#program final.
goal :- h(block(e, horizontal, 2), c(2,4)).

%%Ejemplo 5

#program initial.
#const size=6.
block(j, horizontal, 2).
block(i, vertical,   2).
block(h, vertical,   2).
block(g, vertical,   2).
block(f, vertical,   2).
block(e, horizontal, 2).
block(d, vertical,   2).
block(c, horizontal, 3).
block(b, vertical,   2).
block(a, horizontal, 2).

h(block(j, horizontal, 2), c(5,0)).
h(block(i, vertical,   2), c(4,2)).
h(block(h, vertical,   2), c(3,1)).
h(block(g, vertical,   2), c(2,3)).
h(block(f, vertical,   2), c(2,2)).
h(block(e, horizontal, 2), c(2,0)).
h(block(d, vertical,   2), c(1,5)).
h(block(c, horizontal, 3), c(1,1)).
h(block(b, vertical,   2), c(0,4)).
h(block(a, horizontal, 2), c(0,1)).

#program final.
goal :- h(block(e, horizontal, 2), c(2,4)).

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
h(block(a, vertical,   3), c(0,2)).

#program final.
goal :- h(block(d, horizontal, 2), c(2,4)).

%%Ejemplo 7

#program initial.
#const size=6.
block(k, horizontal, 3).
block(j, vertical,   2).
block(i, vertical,   2).
block(h, horizontal, 2).
block(g, vertical,   3).
block(f, horizontal, 2).
block(e, vertical,   3).
block(d, vertical,   3).
block(c, horizontal, 2).
block(b, vertical,   2).
block(a, horizontal, 2).

h(block(k, horizontal, 3), c(5,3)).
h(block(j, vertical,   2), c(4,0)).
h(block(i, vertical,   2), c(3,2)).
h(block(h, horizontal, 2), c(3,0)).
h(block(g, vertical,   3), c(2,3)).
h(block(f, horizontal, 2), c(2,1)).
h(block(e, vertical,   3), c(1,5)).
h(block(d, vertical,   3), c(1,4)).
h(block(c, horizontal, 2), c(1,0)).
h(block(b, vertical,   2), c(0,3)).
h(block(a, horizontal, 2), c(0,0)).

#program final.
goal :- h(block(f, horizontal, 2), c(2,4)).
