q2 :-  
    readln(X2),
    minus(X2, X),
    loop(X),
    loop_fun2.
   
% x2--
minus(Y, Y1) :- Y1 is Y - 1.
end(0).

% loop_1
loop(X) :- end(X), !.
loop(X) :- incs(X, X1), loop(X1).

incs(X, X1) :- 
    X1 is X - 1, 
    % write(X1), nl,
    readln(A), 
    first(A, N1), last(A, N2),
    add_rule(N1, parent, N2).

% loop_2
loop_fun2 :-
    %write("Find"), 
    readln(X), loop2(X).

loop2(X) :- end(X), !.
loop2(X) :- incs2(X, X1), loop2(X1).

incs2(X, X1) :- 
    X1 is X - 1, 
    readln(A), 
    first(A, N1), last(A, N2), nl,
    lca(N1, N2), nl.


% find lca
ancestor(A,B) :- parent(A,B). 
ancestor(A,B) :- parent(X,B), ancestor(A,X). 

lca(A,B) :- 
  A==B -> write(A);
  ancestor(A,B) -> write(A);
  parent(X,A),lca(X,B).
  
% add fact(parent)
add_rule(X, Predicate, Y) :-
    Fact =.. [Predicate, X, Y],
    assertz(Fact).

% readln to list, get fisrt and last term
first([H|_],H).
last([H], H).
last([_|T], H) :- last(T,H).

