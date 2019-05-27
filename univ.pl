add_rule(X, Predicate, Y) :-
    Fact =.. [Predicate, X, Y],
    assertz(Fact).