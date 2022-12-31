:- include('display.pl').

:- include('score.pl').

:- use_module(library(lists)).

:- use_module(library(random)).

%choose_move(+Board, +Level, -Move)
choose_move(Board, 1, Move):-
    valid_moves(Board, ValidMoves),
    random_move(ValidMoves, Move).

choose_move(Board, 2, Move):-
    valid_moves(Board, ValidMoves),
    smart_move(Board, ValidMoves, Move).

%random_move(+ValidMoves, -Move)
random_move(ValidMoves, Move):-
    length(ValidMoves, L),
    dif(L,0),
    random(0, L, R),
    nth0(R, ValidMoves, Move).

%smart_move(+Board, +ValidMoves, -Move).
smart_move(Board, ValidMoves, Move):-
    length(ValidMoves, L),
    create_score_list(Board, ValidMoves, ScoreList, L),
    %nl,write('Score List: \n'),nl,write(ScoreList),nl,
    max_score_list(ScoreList, [], MaxListIndex, 0, 0, L),
    %nl,write('Max Score List Indexes: \n'),nl,write(MaxListIndex),nl,
    random_member(X, MaxListIndex),
    nth0(X, ValidMoves, Move),
    nl,write('Bot Move: \n'),write(X),nl,write(Move),nl.


%create_score_list(+Board, +ValidMoves, -ScoreList,  +N)
create_score_list(_, [], [], 0).
create_score_list(Board, [Move|TailMove], [Score|TailScore], N):-
    future_play(Board, Move, NewBoard),
    score(0, NewBoard, Move, 0, _, Score, _),
    %nl,write('Move:  '),write(Move),write('    Score:  '),write(Score),
    N > 0,
    N1 is N-1,
    create_score_list(Board, TailMove, TailScore, N1).

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

%future_play(+Board, +Move, -NewBoard)
future_play(Board, [RowNumber,ColumnNumber], NewBoard):-
  nth0(RowNumber, Board, Row),
  replace_elem(1, ColumnNumber, Row, NewRow),
  replace_elem(NewRow, RowNumber, Board, NewBoard).
