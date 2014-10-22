:- consult(two).
:- begin_tests(two).
test(likes) :-
  findall(L, likes(jim, L), Ls),
  findall(S, student(S), Ss),
  assertion(likes(jim, pam)),
  assertion(not(student(pam))),
  assertion(subset(Ss, Ls)).

:- end_tests(two).
% vim: set ft=prolog:
