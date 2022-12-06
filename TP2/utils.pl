:- use_module(library(lists)).

%get_element(+Board, +Row, +Column, -Elem)
get_element(Board, RowNumber, CollumnNumber, Elem):-
  nth0(RowNumber, Board, Row),
  nth0(CollumnNumber, Row, Elem).