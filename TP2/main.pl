:- include('display.pl').

:- include('menu.pl').

:- include('board.pl').

play:-
    game_name,
    select_size(Size),
    select_mode(_),
    create_board(Board, Size, Size), nl,
    print(Board), nl,
    game_loop(Board, 0, 0).

%game_loop(+Board, +Turn, +State)
game_loop(_, _, 2).
game_loop(Board, Turn, State):-
    display_game(Board).
