%

%   1 1
% X 1 2 1
% =======
%   1 2 1
% + 0 1 2 1
%   =======
%   1 3 3 1

add_merge(P, [], P).
add_merge([], Q, Q).

add_merge([H1|T1], [H2|T2], R) :-
  add_merge(T1, T2, Rt),
  H is H1 + H2,
  R = [ H | Rt ].

prod(_, [], R) :- R = [].

prod([], _, R) :- R = [].

prod([H|T], Q, R) :-
  prod(H, Q, Rh),
  prod(T, [0|Q], Rt),
  add_merge(Rh, Rt, R).

prod(_, Q, Q).
