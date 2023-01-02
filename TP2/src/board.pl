% Cria o board do inicio do jogo
%create_board(-List, +N, +Size)
create_board([], 0, _).
create_board([H|T], N, Size):-
  N > 0,
  N1 is N-1,
  NT is Size,
  create_row(H, NT),
  create_board(T, N1, Size).

% Cria cada linha do board com espaçps vazios
%create_row(-List, +N)
create_row([], 0).
create_row([''|Row], N):-
  N > 0,
  N1 is N-1,
  create_row(Row, N1).
