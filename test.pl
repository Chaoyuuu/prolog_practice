ancestor(A,B) :- parent(A,B). 
ancestor(A,B) :- parent(X,B),ancestor(A,X). 

lca(A,B) :- 
  A==B -> write(A);
  ancestor(A,B) -> write(A);
  parent(X,A),lca(X,B).
  

parent(1,2).
parent(2,3).
parent(1,4).
parent(4,5).
parent(4,6).


q2 :-
    readln(X),
    loop2(X).

incs2(X, X1) :- X1 is X - 1, 
  % write(X1), 
  readln(A), 
  % write(A), 
  first(A, N1), last(A, N2), 
  % write(N1), write(N2),
  nl, lca(N1, N2), nl.

loop2(X) :- end(X), !.
loop2(X) :- incs2(X, X1), loop2(X1).

end(0).

first([H|_],H).
last([H], H).
last([_|T], H) :- last(T,H).