:- include('utils.pl').

%display_game(+Board)
display_game(Board):-
  length(Board, N),
  NSize is N - 1,
  display_header(Board, 0, NSize),
  display_board(Board, NSize),
  display_footer(Board, 0, NSize), nl.

%display_header(+Board, +N, +Size)
display_header(Board, N, N):-
  get_element(Board, 0, N, ''),
  printLineDivision, put_code(9559), nl.
display_header(Board, N, N):-
  get_element(Board, 0, N, 1),
  printLineDivision, put_code(9679), nl.

display_header(Board, 0, Size):-
  get_element(Board, 0, 0, ''),
  write('      '), put_code(9556),
  display_header(Board, 1, Size).
display_header(Board, 0, Size):-
  get_element(Board, 0, 0, 1),
  write('      '), put_code(9679),
  display_header(Board, 1, Size).

display_header(Board, N, Size):-
  get_element(Board, 0, N, ''),
  printLineDivision, put_code(9574),
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
  display_board_row_bot(Board, 0, NSize, RowIndex),
  display_board_row_top(Board, 0, NSize).

display_board_aux(Board, N, NLines, NSize):-
  N < NLines,
  NewN is N + 1,
  RowIndex is NLines + 1,
  display_board_row_top(Board, 0, NSize),
  display_board_row_bot(Board, 0, NSize, RowIndex),
  display_board_aux(Board, NewN, NLines, NSize).

%display_board_row_top(+Board, +N, +NSize)
display_board_row_top(Board, N, N):-
  write('      '), put_code(9553), nl.

display_board_row_top(Board, 0, NSize):-
  write('      '), put_code(9553),
  display_board_row_top(Board, 1, NSize).

display_board_row_top(Board, N, NSize):-
  write('      '), put_code(9553),
  NewN is N+1,
  display_board_row_top(Board, NewN, NSize).

%display_board_row_bot(+Board, +N, +NSize, +RowIndex)
display_board_row_bot(Board, N, N, RowIndex):-
  get_element(Board, RowIndex, N, ''),
  put_code(9571), nl.
display_board_row_bot(Board, N, N, RowIndex):-
  get_element(Board, RowIndex, N, 1),
  put_code(9679), nl.

display_board_row_bot(Board, 0, NSize, RowIndex):-
  get_element(Board, RowIndex, 0, ''),
  write('      '), put_code(9568), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).
display_board_row_bot(Board, 0, NSize, RowIndex):-
  get_element(Board, RowIndex, 0, 1),
  write('      '), put_code(9679), printLineDivision,
  display_board_row_bot(Board, 1, NSize, RowIndex).

display_board_row_bot(Board, N, NSize, RowIndex):-
  get_element(Board, RowIndex, N, ''),
  put_code(9580), printLineDivision,
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
  put_code(9565), nl.
display_footer(Board, N, N):-
  get_element(Board, N, N, 1),
  put_code(9679), nl.

display_footer(Board, 0, NSize):-
  get_element(Board, NSize, 0, ''),
  write('      '), put_code(9562), printLineDivision,
  display_footer(Board, 1, NSize).
display_footer(Board, 0, NSize):-
  get_element(Board, NSize, 0, 1),
  write('      '), put_code(9679), printLineDivision,
  display_footer(Board, 1, NSize).

display_footer(Board, N, NSize):-
  get_element(Board, NSize, N, ''),
  put_code(9577), printLineDivision,
  NewN is N + 1,
  display_footer(Board, NewN, NSize).
display_footer(Board, N, NSize):-
  get_element(Board, NSize, N, 1),
  put_code(9679), printLineDivision,
  NewN is N + 1,
  display_footer(Board, NewN, NSize).



printLineDivision :-  
  put_code(9552), put_code(9552), put_code(9552).