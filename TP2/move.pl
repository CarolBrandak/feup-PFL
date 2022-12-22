%valid_moves(+Board, -List)
valid_moves(Board, List):-
  findall([RowNumber,CollumnNumber], get_element(Board, RowNumber, CollumnNumber, ''), List).
  