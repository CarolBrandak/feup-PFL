%create_board(-List, +N, +Size)
create_board([], 0, _).
create_board([H|T], N, Size):-
  N > 0,
  N1 is N-1,
  NT is Size,
  create_row(H, NT),
  create_board(T, N1, Size).

%create_row(-List, +N)
create_row([], 0).
create_row([1|Row], N):-
  N > 0,
  N1 is N-1,
  create_row(Row, N1).