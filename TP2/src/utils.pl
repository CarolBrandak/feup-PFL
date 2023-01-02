:- use_module(library(lists)).

% Returna o elemento de uma dada coordenada do tabuleiro
%get_element(+Board, +Row, +Column, -Elem)
get_element(Board, RowNumber, CollumnNumber, Elem):-
  nth0(RowNumber, Board, Row),
  nth0(CollumnNumber, Row, Elem).

% Troca de turnos
%change_turn(+Turn, -NewTurn)
change_turn(0,1).
change_turn(1,0).

% Lista das jogadas possiveis
%valid_moves(+Board, -List)
valid_moves(Board, List):-
  findall([RowNumber,CollumnNumber], get_element(Board, RowNumber, CollumnNumber, ''), List).
