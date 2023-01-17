:- dynamic round/4.

:- use_module(library(lists)).

% round(RoundNumber, DanceStyle, Minutes, [Dancer1-Dancer2 | DancerPairs])
% round/4 indica, para cada ronda, o estilo de dança, a sua duração, e os pares de dançarinos participantes.
round(1, waltz, 8, [eugene-fernanda]).
round(2, quickstep, 4, [asdrubal-bruna,cathy-dennis,eugene-fernanda]).
round(3, foxtrot, 6, [bruna-dennis,eugene-fernanda]).
round(4, samba, 4, [cathy-asdrubal,bruna-dennis,eugene-fernanda]).
round(5, rhumba, 5, [bruna-asdrubal,eugene-fernanda]).
round(6, rhumba, 105, [eueueu-tututu]).

% tempo(DanceStyle, Speed).
% tempo/2 indica a velocidade de cada estilo de dança.
tempo(waltz, slow).
tempo(quickstep, fast).
tempo(foxtrot, slow).
tempo(samba, fast).
tempo(rhumba, slow).

% 1.
style_round_number(DanceStyle, RoundNumber):-
    round(RoundNumber, DanceStyle, _, _).

% 2.
n_dancers(RoundNumber, NDancers) :- 
    round(RoundNumber, _, _, DancerPairs),
    length(DancerPairs, N),
    NDancers is N*2.

% 3.
danced_in_round(RoundNumber, Dancer) :- 
    round(RoundNumber, _, _, DancerPairs),
    member(Dancer-_, DancerPairs).

danced_in_round(RoundNumber, Dancer) :- 
    round(RoundNumber, _, _, DancerPairs),
    member(_-Dancer, DancerPairs).

% 4.
n_rounds(NRounds) :- 
    n_rounds_aux(1, 0, NRounds).

n_rounds_aux(RoundNumber, Acc, NRounds) :- 
    round(RoundNumber, _, _, _),
    NewAcc is Acc + 1,
    NextRoundNumber is RoundNumber + 1,
    n_rounds_aux(NextRoundNumber, NewAcc, NRounds).
n_rounds_aux(_, Acc, Acc).

% 5.
add_dancer_pair(_, _, _):-
    fail.
add_dancer_pair(RoundNumber, Dancer1, Dancer2):-
    round(RoundNumber, DanceStyle, Minutes, DancerPairs),
    member(Dancer1-_, DancerPairs),
    member(_-Dancer1, DancerPairs),
    member(Dancer2-_, DancerPairs),
    member(_-Dancer2, DancerPairs),
    append(DancerPairs, [Dancer1-Dancer2], NewDancerPairs),
    retract(round(RoundNumber, DanceStyle, Minutes, DancerPairs)),
    asserta(round(RoundNumber, DanceStyle, Minutes, NewDancerPairs)).

add_dancer_pair2(Round, Dancer1, Dancer2):-
    \+ danced_in_round(Round, Dancer1),
    \+ danced_in_round(Round, Dancer2),
    retract( round(Round, Style, Minutes, Pairs) ),
    assert( round(Round, Style, Minutes, [Dancer1-Dancer2|Pairs]) ).

% 6.
total_dance_time(Dancer, Time):-
    total_dance_time_aux(1, Dancer, 0, Time),!.
    
total_dance_time_aux(NRound, Dancer, Acc, Time):-
    danced_in_round(NRound, Dancer),
    round(NRound, _, Ntime, _),
    NewAcc is Acc+Ntime,
    NewNRound is NRound+1,
    total_dance_time_aux(NewNRound, Dancer, NewAcc, Time).

total_dance_time_aux(NRound, Dancer, Acc, Time):-
    round(NRound, _, _, _),
    NewNRound is NRound+1,
    total_dance_time_aux(NewNRound, Dancer, Acc, Time).

total_dance_time_aux(_, _, Acc, Acc).

% 7.
print_program:-
    round(_, DanceStyle, Minutes, DancerPairs),
    write(DanceStyle), 
    write(' ('), 
    write(Minutes), 
    write(') - '), 
    length(DancerPairs, N),
    write(N),
    nl,
    fail.
    
print_program.

% 8.
dancer_n_dances(Dancer, NDances):-
    bagof(Round, danced_in_round(Round, Dancer), L),
    length(L,NDances).

% 9.
most_tireless_dancer(Dancer):-
    setof(Time-Dancer1, Round ^ (danced_in_round(Round, Dancer1), total_dance_time(Dancer1, Time)), List),
    reverse(List, [_-Dancer|_]).

% 10. O predicado predX(+L,-N) recebe uma lista L de termos e retorna em N o número de termos em L de aridade 2.

% 11. O cut é vermelho pois afeta o conjunto de soluções devolvidas por predX/2. Se for removido, predX/2 retorna diferentes valores de N (inferiores ao resultado correto) por backtracking.

% 12. A unificação produz sempre o mínimo de substituições possíveis para que X e Y sejam idênticos.

% 13. O uso de listas de diferença permite reimplementar certos predicados de complexidade temporal quadrática em tempo linear.

% 14.
:- op(580, xfy, and).

% 15.
:- op(600, xfx, dances).

edge(a,b).
edge(a,c).
edge(a,d).
edge(b,e).
edge(b,f).
edge(c,b).
edge(c,d).
edge(c,e).
edge(d,a).
edge(d,e).
edge(d,f).
edge(e,f).

% 16.
shortest_safe_path(Origin, Destination, ProhibitedNodes, Path):-
    shortest_aux([[Origin]], Destination, ProhibitedNodes, PathInv),
    reverse(PathInv, Path).

shortest_aux([[Dest|Tail]|_], Dest, _, [Dest|Tail]).
shortest_aux([[Last|Tail]|Xs], Dest, ProhibitedNodes, Sol):-
    findall([NewLast, Last|Tail], (edge(Last, NewLast), \+member(NewLast, [Last|Tail]), \+member(NewLast, ProhibitedNodes)), Paths),
    append(Xs, Paths, NewPaths),
    shortest_aux(NewPaths, Dest, ProhibitedNodes, Sol).

% 17.
all_shortest_safe_paths(Origin, Dest, Proh, L):-
    shortest_safe_path(Origin, Dest, Proh, Path),
    !,
    length(Path, N),
    length(VarPath, N),
    findall(VarPath, shortest_safe_path(Origin, Dest, Proh, VarPath), L).
