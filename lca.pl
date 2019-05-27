ancestor(A,B) :- parent(A,B). 
ancestor(A,B) :- parent(X,B),ancestor(A,X). 

lca(A,B) :- 
  A==B -> write(A);
  ancestor(A,B) -> write(A);
  parent(X,A),lca(X,B).
  

parent(a,b).
parent(a,c).
parent(b,d).
parent(b,e).
parent(c,f).
parent(d,g).
