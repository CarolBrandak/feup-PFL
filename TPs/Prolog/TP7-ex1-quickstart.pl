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