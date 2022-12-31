:- use_module(library(lists)).

%get_element(+Board, +Row, +Column, -Elem)
get_element(Board, RowNumber, CollumnNumber, Elem):-
  nth0(RowNumber, Board, Row),
  nth0(CollumnNumber, Row, Elem).

%change_turn(+Turn, -NewTurn)
change_turn(0,1).
change_turn(1,0).

%valid_moves(+Board, -List)
valid_moves(Board, List):-
  findall([RowNumber,CollumnNumber], get_element(Board, RowNumber, CollumnNumber, ''), List).
