has_factor(N,L) :- N mod L =:= 0.
has_factor(N,L) :- L * L < N, L2 is L + 2, has_factor(N,L2).

is_prime(2).
is_prime(3).
is_prime(P) :- integer(P), P > 3, P mod 2 =\= 0, \+ has_factor(P,3).  

next_prime(P,P1) :- P1 is P + 2, is_prime(P1), !.
next_prime(P,P1) :- P2 is P + 2, next_prime(P2,P1).

goldbach(4,[2,2]).

search_goldbach(N,L) :-
  N == 4 -> write("2 2"), nl; 
  N == 6 -> write("3 3"), nl;
  N mod 2 =:= 0,
  N > 4,
  if_goldbach(N,L,3).

if_goldbach(N,[P,Q],P) :-
  Q is N - P,
  is_prime(Q), P < Q ,
  write(P), write(" "), write(Q), nl,
  next_prime(P,P1),
  if_goldbach(N,L,P1).
  
if_goldbach(N,L,P) :- P > N/2, nl, !.

if_goldbach(N,L,P) :- 
  P < N,
  next_prime(P,P1),
  if_goldbach(N,L,P1).

main :- 
  read(X), write("Output "), nl, 
  search_goldbach(X, [A, B]).

