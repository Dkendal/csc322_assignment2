% 1.a
zero([]).
zero([H|T]):-
  H = 0, zero(T).

% 1.b
power([]):- fail.
power([0]):- fail.
power([H|T]):-
  H = 0, power(T);
  zero(T).


% 1.c
normal([Head|Tail], Q):-
  zero(Tail), Q = [Head], !;
  normal(Tail,Z), append([Head], Z, Q).

% 1.d
term(Coefficient, X, Power, R):-
  R is (X ** Power) * Coefficient.

eval(P, X, R):-
  reverse(P, L),
  evalr(L, X, R).

evalr([], _, 0).

evalr([H|T], X, R) :-
  length(T, Power),
  H1 is H * X ** Power,
  evalr(T, X, PartialSum),
  R is H1 + PartialSum.

sum([], [], []).
sum([], Q,  R) :- Q \= [], sum([0], Q, R).
sum(P, [],  R) :- P \= [], sum(P, [0], R).


sum([H1|T1], [H2|T2], R) :-
  H is H1 + H2,
  write(H),
  sum(T1, T2, T),
  R = [H|T].

:- begin_tests(assignment).
test(zero) :-
  not(zero([a,0,0,0])),
  zero([0,0,0,0]),
  zero([]).

test(power) :-
  power([0,a,0,0,0,0]),
  not(power([0,a,b,0,0,0])),
  not(power([])).

test(normal) :-
  normal([a,b,c,0,d,0,0,0], [a,b,c,0,d]).

test(eval) :-
  P = [1,2,3], Q = 2,
  eval(P, Q, R),
  assertion(R == 17).

test(sum) :-
  P = [2,0,3],
  Q = [2,4,5,2],
  sum(P, Q, R),
  assert(R = [4,4,8,2]).

:- end_tests(assignment).

