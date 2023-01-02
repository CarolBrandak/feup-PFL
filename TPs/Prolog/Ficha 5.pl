%1
%c) Modigicado
separate(L, Pred, SortedList):-
    separate_aux(L, Pred, Ys, Ns),
    append(Ys, Ns, SortedList).

separate_aux([], _, [], []).
separate_aux([H|T], Pred, [H|Ys], Ns):-
    Goal =.. [Pred, H],
    call(Goal), !, 
    separate_aux(T, Pred, Ys, Ns).
separate_aux([H|T], Pred, Ys, [H|Ns]):- 
    %Goal =.. [Pred, H],
    %/+call(Goal),
    separate_aux(T, Pred, Ys, Ns).

%5
%a)
:-op(600, fx, flight).
:-op(550, xfx, from).
:-op(500, xfx, to).
:-op(450, xfx, at).
:-op(400, xfx, :).

%b)
:-op(600, fx, if).
:-op(599, xfx, then).
:-op(598, xfx, else).

if X then Y else _:-
    call(X), !, call(Y).
if _ then _ else Z:-
    call(Z).    

test_num (X):-
    if (X<4) then (if (X<2) then white(muito_menor) else white(menor)) else white(maior).


/*insert
    insert(a, 1, [1, 2, 3], L).
    L=[1, a, 2, 3]
*/

insert(Elem, 0, L, [X|L]).
insert(Elem, P, [H|T], [H|T1]):-
    N>0, 
    N1 is N-1,
    insert(Elem, N1, T, T1).