:- consult(bonus).
:- begin_tests(bonus).
test(prod) :-
  P = [1,1],
  Q = [1,2,1],
  Re = [1,3,3,1],
  prod(P, Q, R),
  assertion(Re == R).

:- end_tests(bonus).
% vim: set ft=prolog:
