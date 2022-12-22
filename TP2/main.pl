:- include('display.pl').

:- include('menu.pl').

:- include('board.pl').

:- include('move.pl').

play:-
    game_name,
    initial_size(Size),
    select_mode(_),
    create_board(Board, Size, Size), nl,
    write('Board:'),nl,
    print(Board), nl, nl,
    write('Valid Moves:'),nl,
    valid_moves(Board, ValidMoves),
    print(ValidMoves), nl,nl,
    game_loop(Board, 0, 0).

%game_loop(+Board, +Turn, +State)
game_loop(_, _, 2).
game_loop(Board, Turn, State):-
    PlayerTurn is Turn + 1,
    print('Player '), print(PlayerTurn), print(' Turn'), nl,
    print('Select a coordinate to play (Ex: 1 1)'), nl, nl,
    display_game(Board).
    