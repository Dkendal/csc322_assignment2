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

% 1.e
sum([], [], []).

sum([], Q, R) :- sum([0], Q, R).
sum(P, [], R) :- sum(P, [0], R).

sum([H1|T1], [H2|T2], R) :-
  H is H1 + H2,
  sum(T1, T2, T),
  R = [H|T].
