%
zero([]).
zero([H|T]):-
  H = 0, zero(T).

power([]):- fail.
power([0]):- fail.
power([H|T]):-
  H = 0, power(T);
  zero(T).

normal([Head|Tail], Y):-
  zero(Tail), Y = [Head], !;
  normal(Tail,Z), append([Head], Z, Y).
