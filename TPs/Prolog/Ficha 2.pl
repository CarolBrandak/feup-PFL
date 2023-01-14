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
    S1 is S+1,
    list_size(XS, S1).

% b)
% list_sum(+List,?Sum)
list_sum([],0).
list_sum([X|XS], S):- 
    S1 is S + X,
    list_sum(XS,S1).

% c)
% list_prod(+List,?Prod)
list_prod([],1).
list_prod([X|XS],Prod):- 
    Prod is ProdTail * X,
    list_prod(XS,ProdTail).

% d)
% inner_product(+List,+List1,?Prod)
inner_product([],[],0).
inner_product([X|XS],[Y|YS],Prod):-
    Prod is ProdRest + Y*X,
    inner_product(XS,YS,ProdRest).

% e)
% count(+Elem,+List,?N).
count(_,[],0).
count(Elem,[Elem|XS],N):- 
    N1 is N -1, 
    count(Elem,XS,N1).
count(Elem,[X|XS],N):- 
    Elem is Elem\X,
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

%7
%b)
list_member(X, L):-
    append(_, [X|_], L).

%d)
list_nth(N, L, X):-
    length(Prefix, N),
    append(Prefix, [X|_], L).
    

