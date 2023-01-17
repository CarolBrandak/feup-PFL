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

% 2.
checkNumJornadas(Treinador,[[Menor-Maior]-Treinador|_], NumeroJornadas):-
    NumeroJornadas is Maior-Menor+1.
checkNumJornadas(Treinador,[_|Resto], NumeroJornadas):-
    checkNumJornadas(Treinador, Resto, NumeroJornadas).
checkNumJornadas(_,[], _):-fail.

n_jornadas_treinador(Treinador, NumeroJornadas):-
    treinadores(_, Jornadas),
    checkNumJornadas(Treinador, Jornadas, NumeroJornadas).

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
% a) Se N for enviado como argumento permite saber se N dentro de [A,B], se N for o valor de retorno Ntem o valor de A inicialmente e permite obter todos os valores até B, sendo o final N=B.
% b) É um cut verde pois estar presente não altera as solucoes ovtidas pelo perdicado. Mesmo sendo para efital backtraking desnecessario.

% 8.
getjornadas(Treinador, [Jornadas-Treinador|_], Jornadas).
getjornadas(Treinador, [_|Resto], Jornadas):-
    getjornadas(Treinador, Resto, Jornadas).
getjornadas(_, [], _):- fail.

naoPerdeu(_, Inicio, Final) :- 
    Inicio > Final.
naoPerdeu(Equipa, Jornada, Final) :- 
    \+ ganhou(Jornada, _, Equipa),
    NewJornada is Jornada + 1,
    naoPerdeu(Equipa, NewJornada, Final).

treinador_bom(Treinador):-
    treinadores(Equipa, Jornadas),
    getjornadas(Treinador, Jornadas, [Inicio-Final]),
    naoPerdeu(Equipa, Inicio, Final).

imprime_totobola(1, '1').
imprime_totobola(0, 'X').
imprime_totobola(-1, '2').
imprime_texto(X,'vitoria da casa'):-
    X = 1.
imprime_texto(X,'empate'):-
    X = 0.
imprime_texto(X,'derrota da casa'):-
    X = -1.
