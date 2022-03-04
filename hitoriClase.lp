#const n=3.
row(0..n-1).
col(0..n-1).
cell(c(R,C)) :- row(R), col(C).
{black(X) : cell(X)}.
adj(c(R,C), c(R,c+1)) :- cell(c(R,C)), col(C+1).
