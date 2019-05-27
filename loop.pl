incs(X, X1) :- X1 is X - 1.

loop(X) :- end(X), !.
loop(X) :- incs(X, X1), loop(X1).