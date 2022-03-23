#program initial.
#const height=6.
#const width=6.
block(a, vertical, 3).
h(block(a, vertical, 3), c(0, 2)).
block(b, vertical, 2).
h(block(b, vertical, 2), c(0, 3)).
block(c, vertical, 3).
h(block(c, vertical, 3), c(0, 5)).
block(d, horizontal, 2).
h(block(d, horizontal, 2), c(2, 0)).
block(e, vertical, 2).
h(block(e, vertical, 2), c(2, 3)).
block(f, vertical, 2).
h(block(f, vertical, 2), c(3, 1)).
block(g, horizontal, 2).
h(block(g, horizontal, 2), c(4, 2)).

#program final.
goal:- h(block(d, horizontal, 2), c(2,4)).

