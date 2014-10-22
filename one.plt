:- consult(one).

:- begin_tests(assignment).
test(zero) :-
  not(zero([a, 0, 0, 0])),
  zero([0, 0, 0, 0]),
  zero([]).

test(power) :-
  power([0, a, 0, 0, 0, 0]),
  not(power([0, a, b, 0, 0, 0])),
  not(power([])).

test(normal) :-
  normal([a, b, c, 0, d, 0, 0, 0],  [a, b, c, 0, d]).

test(eval) :-
  P = [1, 2, 3],  Q = 2,
  eval(P, Q, R),
  assertion(R == 17).

test(sum) :-
  sum([2, 0, 3, 3],  [2, 4, 5, 2],  S),
  assertion(S == [4, 4, 8, 5]).

test(sum_first_param_longer) :-
  sum([1, 0, 3],  [2, 4, 5, 2],  R),
  assertion(R == [3, 4, 8, 2]).

test(sum_second_param_longer) :-
  sum([1, 0, 3, 2],  [2, 4, 5],  R),
  assertion(R == [3, 4, 8, 2]).

:- end_tests(assignment).

% vim:set ft=prolog :
