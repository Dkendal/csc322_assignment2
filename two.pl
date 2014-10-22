% jim likes only students
%
student(fred).
student(joe).

likes(jim, R) :- student(R).
likes(jim, pam).
