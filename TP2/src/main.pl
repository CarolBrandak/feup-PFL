:- include('menu.pl').

:- include('move.pl').

:- include('examples.pl').

% Demonstração do estado inicial conforme o size
display_initial_size(Size):-
    initial_size(Size, Board),nl,
    display_game(Board).

% Demonstração do estado inicial
display_initial:-
    initial(Board),nl,
    display_game(Board).

% Demonstração do estado intremédio
display_mid:-
    mid(Board),nl,
    display_game(Board).

% Demonstração do estado final
display_final:-
    final(Board),nl,
    display_game(Board).

% Chamada inicial do jogo
play:-
    game_name,
    initial_size(Size),
    select_mode(Mode),
    choose_ai_level(Mode, CPUs),
    create_board(Board, Size, Size), nl,
    display_game(Board),
    game_loop(Board, CPUs, 0, 0, 0, 0), nl,
    write('\nFinished execution\n').

% Ciclo do jogo
%game_loop(+Board, +CPUs, +Turn, +State, +Score1, +Score2)
game_loop(_, _, _, 1, Score1, Score2):-
    game_over(Score1, Score2),
    write('\nGame Over\n').
game_loop(Board, CPUs, Turn, 0, Score1, Score2):-
    PlayerTurn is Turn + 1,
    print('Player '), print(PlayerTurn), print(' Turn'), nl,
    next_move(Turn, Board, CPUs, Move, NewBoard),
    score(Turn, NewBoard, Move, Score1, Score2, NewScore1, NewScore2),
    write('\nPlayer 1 Score:'),nl,
    print(NewScore1), nl, nl,
    write('Player 2 Score:'),nl,
    print(NewScore2), nl, nl,
    display_game(NewBoard),
    check_game_over(NewBoard, NewState),
    change_turn(Turn, NewTurn),
    game_loop(NewBoard, CPUs, NewTurn, NewState, NewScore1, NewScore2).
    