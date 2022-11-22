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

%d
course_classes(UC,L):-
    findall(Dia/Hora-Tipo, class(UC, Tipo, Dia, Hora, _), L).

%c
short_classes(L):-
    findall(UC-Dia/Hora, (class(UC, _, Dia, Hora, Dur), Dur<2), L).

