:- include('utils.pl').

% Mostra o tabuleiro
%display_game(+Board)
display_game(Board):-
  length(Board, N),
  NSize is N - 1,
  display_xcoords(Board, 0, NSize),nl,
  display_header(Board, 0, NSize),
  display_board(Board, NSize),
  display_footer(Board, 0, NSize), nl.

% Mostra as cordenadas da coluna
%display_xcoords(+Board, +N, +Size)
display_xcoords(_, N, N):-
  write('       '), write(N), nl.
display_xcoords(_, 0, Size):-
  write('         '), write('0'),
  display_xcoords(_, 1, Size).

display_xcoords(Board, N, Size):-
  N > 9,
  write('      '), write(N),
  NewN is N+1,
  display_xcoords(Board, NewN, Size).

display_xcoords(Board, N, Size):-
  write('       '), write(N),
  NewN is N+1,
  display_xcoords(Board, NewN, Size).

%display_header(+Board, +N, +Size)
display_header(Board, N, N):-
  get_element(Board, 0, N, ''),
  printLineDivision, put_code(9491), nl.
display_header(Board, N, N):-
  get_element(Board, 0, N, 1),
  printLineDivision, put_code(9679), nl.

display_header(Board, 0, Size):-
  get_element(Board, 0, 0, ''),
  write('     '), write('0'), write('  '), put_code(9487),
  display_header(Board, 1, Size).
display_header(Board, 0, Size):-
  get_element(Board, 0, 0, 1),
  write('     '), write('0'), write('  '), put_code(9679),
  display_header(Board, 1, Size).

display_header(Board, N, Size):-
  get_element(Board, 0, N, ''),
  printLineDivision, put_code(9523),
  NewN is N+1,
  display_header(Board, NewN, Size).
display_header(Board, N, Size):-
  get_element(Board, 0, N, 1),
  printLineDivision, put_code(9679),
  NewN is N+1,
  display_header(Board, NewN, Size).

%display_board(+Board, +NSize)
display_board(Board, NSize):-
  NLines is NSize - 2,
  display_board_aux(Board, 0, NLines, NSize).

%display_board_aux(+Board, +N, +NLines, +NSize)
display_board_aux(Board, N, N, NSize):-
  RowIndex is N + 1,
  display_board_row_top(Board, 0, NSize),
  display_board_row_top(Board, 0, NSize),
  display_board_row_bot(Board, 0, NSize, RowIndex),
  display_board_row_top(Board, 0, NSize),
  display_board_row_top(Board, 0, NSize).

display_board_aux(Board, N, NLines, NSize):-
  N < NLines,
  NewN is N + 1,
  RowIndex is N + 1,
  display_board_row_top(Board, 0, NSize),
  display_board_row_top(Board, 0, NSize),
  display_board_row_bot(Board, 0, NSize, RowIndex),
  display_board_aux(Board, NewN, NLines, NSize).

%display_board_row_top(+Board, +N, +NSize)
display_board_row_top(_, N, N):-
  write('      '), put_code(9475), nl.

display_board_row_top(Board, 0, NSize):-
  write('        '), put_code(9475),
  display_board_row_top(Board, 1, NSize).

display_board_row_top(Board, N, NSize):-
  write('      '), put_code(9475),
  NewN is N+1,
  display_board_row_top(Board, NewN, NSize).

%display_board_row_bot(+Board, +N, +NSize, +RowIndex)
display_board_row_bot(Board, N, N, RowIndex):-
  get_element(Board, RowIndex, N, ''),
  put_code(9515), nl.
display_board_row_bot(Board, N, N, RowIndex):-
  get_element(Board, RowIndex, N, 1),
  put_code(9679), nl.

display_board_row_bot(Board, 0, NSize, RowIndex):-
  RowIndex > 9,
  get_element(Board, RowIndex, 0, ''),
  write('     '), write(RowIndex), write(' '), put_code(9507), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).
  
display_board_row_bot(Board, 0, NSize, RowIndex):-
  RowIndex > 9,
  get_element(Board, RowIndex, 0, 1),
  write('     '), write(RowIndex), write(' '), put_code(9679), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).

display_board_row_bot(Board, 0, NSize, RowIndex):-
  get_element(Board, RowIndex, 0, ''),
  write('     '), write(RowIndex), write('  '), put_code(9507), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).

display_board_row_bot(Board, 0, NSize, RowIndex):-
  get_element(Board, RowIndex, 0, 1),
  write('     '), write(RowIndex), write('  '), put_code(9679), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).

display_board_row_bot(Board, N, NSize, RowIndex):-
  get_element(Board, RowIndex, N, ''),
  put_code(9547), printLineDivision,
  NewN is N + 1,
  display_board_row_bot(Board, NewN, NSize, RowIndex).

display_board_row_bot(Board, N, NSize, RowIndex):-
  get_element(Board, RowIndex, N, 1),
  put_code(9679), printLineDivision,
  NewN is N + 1,
  display_board_row_bot(Board, NewN, NSize, RowIndex).

%display_footer(+Board, +N, +NSize)
display_footer(Board, N, N):-
  get_element(Board, N, N, ''),
  put_code(9499), nl.
display_footer(Board, N, N):-
  get_element(Board, N, N, 1),
  put_code(9679), nl.

display_footer(Board, 0, NSize):-
  NSize > 9,
  get_element(Board, NSize, 0, ''),
  write('     '), write(NSize), write(' '), put_code(9495), printLineDivision,
  display_footer(Board, 1, NSize).
display_footer(Board, 0, NSize):-
  NSize > 9,
  get_element(Board, NSize, 0, 1),
  write('     '), write(NSize), write(' '), put_code(9679), printLineDivision,
  display_footer(Board, 1, NSize).

display_footer(Board, 0, NSize):-
  get_element(Board, NSize, 0, ''),
  write('     '), write(NSize), write('  '), put_code(9495), printLineDivision,
  display_footer(Board, 1, NSize).
display_footer(Board, 0, NSize):-
  get_element(Board, NSize, 0, 1),
  write('     '), write(NSize), write('  '), put_code(9679), printLineDivision,
  display_footer(Board, 1, NSize).

display_footer(Board, N, NSize):-
  get_element(Board, NSize, N, ''),
  put_code(9531), printLineDivision,
  NewN is N + 1,
  display_footer(Board, NewN, NSize).
display_footer(Board, N, NSize):-
  get_element(Board, NSize, N, 1),
  put_code(9679), printLineDivision,
  NewN is N + 1,
  display_footer(Board, NewN, NSize).



printLineDivision :-  
  put_code(9473), put_code(9473), put_code(9473).