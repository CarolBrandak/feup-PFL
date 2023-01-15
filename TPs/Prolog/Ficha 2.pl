% 1.
% a)
% fatorial(+N, ?F).
fatorial(0,1).
fatorial(N, F):-
    N>=0,
    N1 is N-1,
    fatorial(N1, F1),
    F is F1*N.

% b)
% somaRec(+N,?Sum)
somaRec(0,0).
somaRec(N,Sum):-
    N > 0,
    N1 is N -1,
    Sum1 is Sum - N,
    somaRec(N1,Sum1).

% c)
%fibonacci(+N,?F)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F):-
    N > 0,
    N1 is N -1,
    N2 is N- 2,
    fibonacci(N1,F1),
    fibonacci(N2,F2),
    F is F1 + F2.

% d)
isPrimeHelper(X,C):- 
    C*C > X,
    !.
isPrimeHelper(X,C):-
    format("isPrime(~d,~d) resto é ~d \n",[X,C,X mod C]),
    (X mod C) \= 0,
    C1 is C+1,
    isPrimeHelper(X,C1).

% isPrime(+X)
isPrime(1).
isPrime(N):- N > 1,isPrimeHelper(N,2).

% 2.
% a)
% ancestor(?X,?Y)
ancestor(X,Y):- parent(X,Y).
ancestor(X,Y):- parent(X,Z),ancestor(Z,Y).

% b)
% descendant(?X,?Y)
descendant(X,Y) :- ancestor(Y,X).

% 3.
cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).

chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).
% superior(?X,?Y)
superior(X,Y):- chefe(X,Y).
superior(X,Y):- chefe(X,Z),superior(Z,Y).

/* 4.
a) yes
b) Erro
c) yes
d) H = pfl, T = [lbaw, redes, ltw]
e) H = lbaw, T = [ltw]
f) H = leic, T = []
g) no
h) H = leic, T = [[pfl, ltw, lbaw, redes]]
i)H= leic, T=[Two]
j)Inst=gram LEIC=feup
k)One=1, Two=2, Tail=[3,4]
l)One=leic, Rest=[Two|Tail]
*/

% 5.
% a)
%list_size(+List, ?Size)
list_size([], 0).
list_size([_|XS], S):-
    list_size(XS, S1),
    S is S1+1.

% b)
% list_sum(+List,?Sum)
list_sum([],0).
list_sum([X|XS], S):- 
    list_sum(XS,S1),
    S is S1 + X.

% c)
% list_prod(+List,?Prod)
list_prod([],1).
list_prod([X|XS],Prod):- 
    list_prod(XS,Prod1),
    Prod is Prod1 * X.

% d)
% inner_product(+List,+List1,?Prod)
inner_product([],[],0).
inner_product([X|XS],[Y|YS],Prod):-
    inner_product(XS,YS,ProdRest),
    Prod is ProdRest + Y*X.

% e)
% count(+Elem,+List,?N).
count(_,[],0).
count(Elem,[Elem|XS],N):- 
    count(Elem,XS,N1),
    N is N1+1.
count(Elem,[X|XS],N):- 
    Elem \= X,
    count(Elem,XS,N).

% 6.
% a)
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

% b)
%del_one(+Elem, +List1, ?List2)
del_one(_, [], []).
del_one(Elem, [Elem|Xs], List):-
    del_one(_, [], List1),
    append(Xs, List1, List).

del_one(Elem, [X|Xs], List):-
    del_one(Elem, Xs, List1),
    append([X], List1, List).

% c)
%del_all(+Elem, +List1, ?List2)
del_all(_, [], []).
del_all(Elem, [Elem|Xs], List):-
    del_all(Elem, Xs, List).
del_all(Elem, [X|Xs], List):-
    del_all(Elem, Xs, List1),
    append([X], List1, List).

% d)
%del_all_list(+ListElems, +List1, ?List2)
del_all_list([], List, List).
del_all_list([X|Xs], List1, List2):-
    del_all(X, List1, List),
    del_all_list(Xs, List, List2).

% e)
%del_dups(+List1, ?List2)
del_dups([], []).
del_dups([X|Xs],[X|Ys]):- 
    del_all(X,Xs,Z),
    del_dups(Z,Ys).

% f)
%list_perm (+L1, +L2)
list_perm(L1, L2):-
    sort(L1, List),
    sort(L2, List).

% g)
%replicate(+Amount, +Elem, ?List)
replicate(0, _, []).
replicate(A, Elem, [Elem|Xs]):-
    A1 is A-1,
    replicate(A1, Elem, Xs).

% h)
%intersperse(+Elem, +List1, ?List2)
intersperse(_, [X], [X]).
intersperse(Elem, [L1|List1], [L1,Elem|List2]):-
    intersperse(Elem, List1, List2).

% i)
%insert_elem(+Index, +List1, +Elem, ?List2)
insert_elem(0,List1,Elem,[Elem|List1]).
insert_elem(Index,[X|XS],Elem,[X|YS]):- 
    Index1 is Index - 1, 
    insert_elem(Index1,XS,Elem,YS).

% j)
%delete_elem(+Index, +List1, ?Elem, ?List2)
delete_elem(0,[X|XS],X,XS).
delete_elem(Index,[X|XS],Elem,[X|YS]):- 
    Index1 is Index - 1,
    delete_elem(Index1,XS,Elem,YS).

% k)
%replace(+List1, +Index, ?Old, +New, ?List2)
replace([Old|XS],0,Old,New,[New|XS]).
replace([X|XS],N,Old,New,[X|YS]):- 
    N1 is N - 1, 
    replace(XS,N1,Old,New,YS).

% 7.
% a)
list_append(L1, L2, L3):-
    append(L1, L2,L3).
% b)
list_member(X, L):-
    append(_, [X|_], L).

% c)
list_last(List,Last):- 
    append(_,[Last],List).

% d)
list_nth(N, L, X):-
    length(Prefix, N),
    append(Prefix, [X|_], L).

% e)
list_append([],[]).
list_append([X|XS],Result):- 
    append(X,NextResult,Result),
    append(XS,NextResult).

% f)
list_del(List,Elem,Res):- 
    append(Inicio,[Elem|Fim],List),
    append(Inicio,Fim,Res).

% g)
list_before(First,Second,List):- 
    append(_,[First|Resto],List),
    append(_,[Second|_],Resto).

% h)
list_replace_one(X,Y,List1,List2):- 
    append(Inicio,[X|Fim],List1),
    append(Inicio,[Y|Fim],List2).

% i)
list_repeated(X,List):- 
    list_before(X,X,List).

% j)
list_slice(List1,Index,Size,List2):-
    length(List2,Size),
    length(PreSlice,Index),
    append(PreSlice,SliceAndRest,List1),
    append(List2,_Rest,SliceAndRest).

% k)
list_shift_rotate(List1,N,List2):- 
    length(List1,L1Len),
    TrueN is N mod L1Len,
    length(ToRotate,TrueN),
    append(ToRotate,Rest,List1),
    append(Rest,ToRotate,List2).

