:- include('display.pl').

:- include('score.pl').

:- use_module(library(lists)).

:- use_module(library(random)).

% Escolhe a jogada do bot conforme o nivel
%choose_move(+Board, +Level, -Move)
choose_move(Board, 1, Move):-
    valid_moves(Board, ValidMoves),
    random_move(ValidMoves, Move).

choose_move(Board, 2, Move):-
    valid_moves(Board, ValidMoves),
    smart_move(Board, ValidMoves, Move).

% Escolhe uma jogada random da lista de jogadas possiveis
%random_move(+ValidMoves, -Move)
random_move(ValidMoves, Move):-
    length(ValidMoves, L),
    dif(L,0),
    random(0, L, R),
    nth0(R, ValidMoves, Move).

% Escolhe uma jogada com maior score
%smart_move(+Board, +ValidMoves, -Move).
smart_move(Board, ValidMoves, Move):-
    length(ValidMoves, L),
    value(Board, ValidMoves, ScoreList),
    max_score_list(ScoreList, [], MaxListIndex, 0, 0, L),
    random_member(X, MaxListIndex),
    nth0(X, ValidMoves, Move),
    nl,write('Bot Move: \n'),write(Move),nl.

% Determina a lista de scores de cada jogada
%value(+Board, +ValidMoves, -ScoreList)
value(_, [], []).
value(Board, [Move|TailMove], [Score|TailScore]):-
    future_play(Board, Move, NewBoard),
    score(0, NewBoard, Move, 0, _, Score, _),
    value(Board, TailMove, TailScore).

% Devolve lista com indices de maiores scores
%max_score_list(+ScoreList, ?MaxListIndexAux, -MaxListIndex, -MaxScore, +N, +L)
max_score_list(_, MaxListIndex, MaxListIndex, _, L, L).
max_score_list([Score|ScoreTail], MaxListIndexAux, MaxListIndex, MaxScore, N, L):-
    Score < MaxScore,
    NewN is N + 1,
    max_score_list(ScoreTail, MaxListIndexAux, MaxListIndex, MaxScore, NewN, L).

max_score_list([MaxScore|ScoreTail], MaxListIndexAux, MaxListIndex, MaxScore, N, L):-
    NewN is N + 1,
    max_score_list(ScoreTail, [N|MaxListIndexAux], MaxListIndex, MaxScore, NewN, L).

max_score_list([Score|ScoreTail], _, MaxListIndex, MaxScore, N, L):-
    Score > MaxScore,
    NewN is N + 1,
    max_score_list(ScoreTail, [N], MaxListIndex, Score, NewN, L).

% Verifica o estado do jogo depois da jogada
%future_play(+Board, +Move, -NewBoard)
future_play(Board, [RowNumber,ColumnNumber], NewBoard):-
  nth0(RowNumber, Board, Row),
  replace_elem(1, ColumnNumber, Row, NewRow),
  replace_elem(NewRow, RowNumber, Board, NewBoard).
