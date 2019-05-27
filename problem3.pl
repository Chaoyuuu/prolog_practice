reach(A, B) :- neighbor(A, B).
reach(B, A) :- neighbor(A, B).
reach(A, B) :- neighbor(A, X), reach(X, B).

edge(A, B) :-
    A==B -> write("Yes"); !,
    reach(A, B) -> write("Yes"); !,
    neighbor(X,A), edge(X, B). 

neighbor(1, 2).
neighbor(2, 3).
neighbor(3, 5).
neighbor(1, 6).
neighbor(4, 5).
neighbor(5, 6).

neighbor(7, 10).
neighbor(10, 9).
neighbor(8, 9).
neighbor(8, 7).

p3 :-
    edge(2, 5), nl,
    edge(6, 3), nl,
    edge(5, 1), nl,
    edge(9, 7), nl,
    edge(10, 10), nl.


member(X, [X|_]).
member(X, [_|R]) :- member(X, R).
