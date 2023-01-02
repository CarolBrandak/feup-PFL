:- include('ai.pl').

%validate_move(+Move, +Board)
validate_move([Row,Column], Board):-
  length(Board, Size),
  Row >= 0,
  Row < Size,
  Column >= 0,
  Column < Size,
  valid_moves(Board, ValidMoves),
  member([Row,Column], ValidMoves).

%input_move(+Board, -Move)
input_move(Board, [Row,Column]):-
  repeat,
    write('Select row: '),
    read(Row),
    write('Select column: '),
    read(Column),
  validate_move([Row,Column], Board),
  !,
  nl,nl.

%next_move(+Turn, +Board, +CPUs, -Move, -NewBoard)
next_move(_, Board, [0,0], Move, NewBoard):-
  input_move(Board, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [1,0], Move, NewBoard):-
  input_move(Board, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [1,0], Move, NewBoard):-
  choose_move(Board, 1, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [1,1], Move, NewBoard):-
  choose_move(Board, 1, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [1,1], Move, NewBoard):-
  choose_move(Board, 1, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [1,2], Move, NewBoard):-
  choose_move(Board, 1, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [1,2], Move, NewBoard):-
  choose_move(Board, 2, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [2,0], Move, NewBoard):-
  input_move(Board, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [2,0], Move, NewBoard):-
  choose_move(Board, 2, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [2,1], Move, NewBoard):-
  choose_move(Board, 2, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [2,1], Move, NewBoard):-
  choose_move(Board, 1, Move),
  move(Board, Move, NewBoard).

next_move(0, Board, [2,2], Move, NewBoard):-
  choose_move(Board, 2, Move),
  move(Board, Move, NewBoard).

next_move(1, Board, [2,2], Move, NewBoard):-
  choose_move(Board, 2, Move),
  move(Board, Move, NewBoard).

  
%move(+Board, +Move, -NewBoard)
move(Board, [RowNumber,ColumnNumber], NewBoard):-
  nth0(RowNumber, Board, Row),
  replace_elem(1, ColumnNumber, Row, NewRow),
  replace_elem(NewRow, RowNumber, Board, NewBoard).

%replace_elem(+Elem, +Index, +List, -NewList)
replace_elem(_, _, [], []).
replace_elem(Elem, 0, [_|T], [Elem|T2]):-
  replace_elem(Elem, -1, T, T2).
replace_elem(Elem, Index, [H|T], [H|T2]):-
  dif(Index, 0),
  NewIndex is Index - 1,
  replace_elem(Elem, NewIndex, T, T2).

%check_game_over(+Board, -State)
check_game_over(Board, 1):-
  valid_moves(Board, []).

check_game_over(_, 0).

%game_over(+Score1, +Score2)
game_over(Score1, Score2):-
  Score1 > Score2,
  write('\n   Player 1 Wins !!!\n\n').
game_over(Score1, Score2):-
  Score1 < Score2,
  write('\n   Player 2 Wins !!!\n\n').
game_over(Score, Score):-
  write('\n   Its a Tie !!!\n\n').