/*
PFL - Sheet TP7 - Beginning of exercise 1
By: Gonçalo Leão
*/

%%% a
male(frank).
male(jay).
male(javier).
male(merle).
% ...

female(grace).
female(dede).
female(gloria).
female(barb).
% ...


parent(grace,phil).
parent(frank,phil).

parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).

parent(jay,joe).
parent(gloria,joe).

parent(gloria,manny).
parent(javier,manny).

parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).

% ... The next facts for parent/2 correspond to the children of phil and claire

parent(phil, haley).
parent(phil, alex).
parent(phil, luke).
parent(claire, haley).
parent(claire, alex).
parent(claire, luke).

parent(mitchell, lily).
parent(mitchell, rexford).
parent(cameron, lily).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).
parent(dylan, poppy).
parent(haley, poppy).

% c)
father(X,Y):-
    male(X),
    parent(X,Y).

grandparent(X,Y):-
    parent(Parent,Y),
    parent(X,Parent).

grandmother(X,Y):-
    female(X),
    grandparent(X,Y).

siblings(X,Y):-
    parent(A,X),
    parent(A,Y),
    parent(Z,X),
    parent(Z,Y),
    X\=Y,
    A@<Z.

%...

% e)

%married(Person1,Person2,Year).
married(jay,gloria,2008).
married(jay,dede,1968).

divorced(jay,dede,2003).

%is_married(+X,?Y,+Year)
is_married(X,Y,Year):-
    married(X,Y,Year1),
    Year >= Year1,
    \+divorced(X,Y,_).

is_married(X,Y,Year):-
    married(X,Y,Year1),
    Year >= Year1,
    divorced(X,Y,Year2),
    Year =< Year2.

% 6.
% a)

pairs(X, Y):- d(X), q(Y).
pairs(X, X):- u(X).
u(1).
d(2).
d(4).
q(4).
q(16).

