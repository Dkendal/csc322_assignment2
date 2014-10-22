:- consult(two_b).
:- begin_tests(two_b).
test(likes) :-
  likes(jim, R), student(R).
:- end_tests(two_b).
% vim: set ft=prolog:
