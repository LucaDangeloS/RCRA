#program initial.
#const height=6.
#const width=6.
block(a, vertical, 2).
h(block(a, vertical, 2), c(0, 0)).
block(b, vertical, 3).
h(block(b, vertical, 3), c(0, 1)).
block(c, horizontal, 2).
h(block(c, horizontal, 2), c(0, 2)).
block(d, horizontal, 2).
h(block(d, horizontal, 2), c(0, 4)).
block(e, horizontal, 2).
h(block(e, horizontal, 2), c(1, 2)).
block(f, vertical, 3).
h(block(f, vertical, 3), c(1, 4)).
block(g, vertical, 2).
h(block(g, vertical, 2), c(1, 5)).
block(h, horizontal, 2).
h(block(h, horizontal, 2), c(2, 2)).
block(i, horizontal, 2).
h(block(i, horizontal, 2), c(3, 0)).
block(j, vertical, 2).
h(block(j, vertical, 2), c(3, 2)).
block(k, horizontal, 2).
h(block(k, horizontal, 2), c(4, 3)).
block(l, horizontal, 3).
h(block(l, horizontal, 3), c(5, 0)).

#program final.
goal:- h(block(h, horizontal, 2), c(2,4)).

