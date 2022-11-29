/*1.
a) X=1
   X=2
b) X=1 e Y=1
   X=1 e Y=2
   X=2 e Y=1
   X=2 e Y=2
c) X=1 e Y=1
   X=1 e Y=2
*/

/*3.
immature(X) Vermelho
adult(X) Verde
*/

%4
%a
print_n(_, 0).
print_n(S, N):-
   N>0,
   write(S),
   N1 is N-1,
   print_n(S,N1).

%d
read_number(X):-
   read_number_aux(0, X).

read_number_aux(Acc, X):-
   get_code(C),
   C>=48,
   C=<57, 
   !,      
   Acc1 is 10*Acc +(C-48),
   read_number_aux(Acc1, true, X).

read_number_aux(X, true, X).

clear_buffer:-
   repeat,
   get_code(C),
   C = '/n'.

%e
read_until_between(Min, Max, Value):-
   repeat,
   read_number(Value),
   Value>=Min,
   Value=<Max,
   !.

%7
%class(Course, ClassType, DayOfWeek, Time, Duration)
class(pfl, t, '1 Seg', 11, 1).
class(pfl, t, '4 Qui', 10, 1).
class(pfl, tp, '2 Ter', 10.5, 2).
class(lbaw, t, '1 Seg', 8, 2).
class(lbaw, tp, '3 Qua', 10.5, 2).
class(ltw, t, '1 Seg', 10, 1).
class(ltw, t, '4 Qui', 11, 1).
class(ltw, tp, '5 Sex', 8.5, 2).
class(fsi, t, '1 Seg', 12, 1).
class(fsi, t, '4 Qui', 12, 1).
class(fsi, tp, '3 Qua', 8.5, 2).
class(rc, t, '4 Qui', 8, 2).
class(rc, tp, '5 Sex', 10.5, 2).

%a
same_day(UC1, UC2):-
   findall(D, (class(UC1, _, D, _, _), class(UC2, _, D, _, _)), [_|_]).

%c
short_classes(L):-
   findall(UC-Dia/Hora, (class(UC, _, Dia, Hora, Dur), Dur<2), L).

%d
course_classes(UC,L):-
   findall(Dia/Hora-Tipo, class(UC, Tipo, Dia, Hora, _), L).

%f
schedule:-
   setof(D-T-Dur-UC-CT, class(UC, CT, D, T, Dur), L),
   print_classes(L).

print_classes([]).
print_classes([D-T-Dur-UC-CT|Tail]):-
   format('~a (~a) - ~a (~2f, ~2f) ~N', [UC, CT, D, T, Dur]),   
   print_classes(Tail).