loop_fun :-
   
    read(X2),
    minus(X2, X),
    loop(X),
    loop_fun2.
   
minus(Y, Y1) :- Y1 is Y - 1.

incs(X, X1) :- 
    X1 is X - 1, 
    %write(X1), 
    write("Input: "), read(A), read(B), 
    add_rule(A, parent, B).

loop(X) :- end(X), !.
loop(X) :- incs(X, X1), loop(X1).

end(0).


ancestor(A,B) :- parent(A,B). 
ancestor(A,B) :- parent(X,B), ancestor(A,X). 

lca(A,B) :- 
  A==B -> write(A);
  ancestor(A,B) -> write(A);
  parent(X,A),lca(X,B).
  
add_rule(X, Predicate, Y) :-
    Fact =.. [Predicate, X, Y],
    assertz(Fact).

loop_fun2 :-
    read(X),
    loop2(X).

incs2(X, X1) :- 
    X1 is X - 1, 
    %write(X1), 
    write("Input: "), read(A), read(B), 
    lca(A, B).

loop2(X) :- end(X), !.
loop2(X) :- incs2(X, X1), loop2(X1).
