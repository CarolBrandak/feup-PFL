%1
fatorial(0,1).
fatorial(N, F):-
    N>=0,
    N1 is N-1,
    fatorial(N1, F1),
    F is F1*N.

fatorial2(N,F):-
    fatorial2_aux(N,1,F).

fatorial2_aux(0,Acc,Acc).
fatorial2_aux(N,Acc,F):-
    N>0,
    N1 is N-1,
    Acc1 is Acc*N,
    fatorial2_aux(N1,Acc1,F).    


/* 4.
a) yes
b) Erro
c) yes
d)
e)
f)
g)
h)
i)H= leic
T=[Two]? 
yes
j)Inst=gram,
LEIC=feup?
yes
k)One=1,
Two=2,
Tail=[3,4]? yes
l)One=leic,
Rest=[Two|Tail]?
*/

%6
%a)

%invert(?L,-Rev)
invert([], []).
invert([X|Xs], Rev):-
    invert(Xs,XsRev),
    append(XsRev,[X], Rev).

invert2(L,Rev):-
    invert2_aux(L,[],Rev).

invert2_aux([], Acc, Acc).
invert2_aux([X|Xs], Acc, Rev):-
    invert2_aux(Xs, [X|Acc], Rev).

%7
%b)
list_member(X, L):-
    append(_, [X|_], L).

%d)
list_nth(N, L, X):-
    length(Prefix, N),
    append(Prefix, [X|_], L).
    

