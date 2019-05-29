if_reach(A, B) :-
    A == B -> write("Yes"), nl;
    search(A, B, [])-> write("Yes"), nl;
    write("NO").  
    
search(A, B, L) :-
    neighbor(A, X),
    \+memberchk(A, L),
    (
    B == X;
    search(X, B, [A|L])
    ).

q3 :-
  readln(X), 
  last(X, N2),
  loop(N2).

loop(N) :- 
    N > 0 ->
    readln(X), first(X, N1), last(X, N2),
    add_rule(N1, neighbor, N2),
    add_rule(N2, neighbor, N1),
    loop(N-1);
    nl, 
    readln([A|_]),
    loop2(A).

loop2(N) :-
    N > 0 ->
    readln(X), first(X, N1), last(X, N2),
    if_reach(N1, N2),
    loop2(N -1);
    nl . 

add_rule(X, Predicate, Y) :-
    Fact =.. [Predicate, X, Y],
    assertz(Fact).

first([H|_],H).
last([H], H).
last([_|T], H) :- last(T,H).