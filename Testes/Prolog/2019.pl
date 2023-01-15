jogo(1,sporting,porto,1-2).
jogo(1,maritimo,benfica,2-0).
jogo(2,sporting,benfica,0-2).
jogo(2,porto,maritimo,1-0).
jogo(3,maritimo,sporting,1-1).
jogo(3,benfica,porto,0-2).

treinadores(porto,[[1-3]-sergio_conceicao]).
treinadores(sporting,[[1-2]-silas,[3-3]-ruben_amorim]).
treinadores(benfica,[[1-3]-bruno_lage]).
treinadores(maritimo,[[1-3]-jose_gomes]).

% 1.
n_jogadores(Equipa, N):-
    treinadores(Equipa, List),
    lenght(List, N).
/*
% 2.
n_jornadas_treinador(Treinador, NumeroJornadas):-
    treinadores(_, Jornadas),
    ???.   
*/

% 3.
ganhou(Jornada, EquipaVencedora, EquipaDerrotada):-
    jogo(Jornada, EquipaVencedora, EquipaDerrotada, Maior-Menor),
    Maior>Menor.
ganhou(Jornada, EquipaVencedora, EquipaDerrotada):-
    jogo(Jornada, EquipaDerrotada, EquipaVencedora, Menor-Maior),
    Maior>Menor.

% 4. 
:-op(180, fx, o).

% 5. 
:-op(200, xfx, venceu).

% 6.
o X venceu o Y :- ganhou(_, X, Y).

% 7.


