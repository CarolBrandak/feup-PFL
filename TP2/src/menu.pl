:- include('exceptions.pl').

% Print do nome do jogo
game_name:-
    write('\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'),   
    write('                        333333333333333                66666666      999999999     \n'),
    write('                       3:::::::::::::::33             6::::::6     99:::::::::99   \n'),
    write('                       3::::::33333::::::3           6::::::6    99:::::::::::::99 \n'), 
    write('                       3333333     3:::::3          6::::::6    9::::::99999::::::9\n'), 
    write('                                   3:::::3         6::::::6     9:::::9     9:::::9\n'), 
    write('                                   3:::::3        6::::::6      9:::::9     9:::::9\n'), 
    write('                                   3:::::3       6::::::6       9:::::9     9:::::9\n'), 
    write('                           33333333:::::3       6::::::6         9:::::99999::::::9\n'), 
    write('                           3:::::::::::3       6::::::::66666     99::::::::::::::9\n'), 
    write('                           33333333:::::3     6::::::::::::::66     99999::::::::9 \n'), 
    write('                                   3:::::3    6::::::66666:::::6         9::::::9  \n'), 
    write('                                   3:::::3    6:::::6     6:::::6       9::::::9   \n'), 
    write('                                   3:::::3    6:::::6     6:::::6      9::::::9    \n'), 
    write('                       3333333     3:::::3    6::::::66666::::::6     9::::::9     \n'), 
    write('                       3::::::33333::::::3     66:::::::::::::66     9::::::9      \n'),
    write('                       3:::::::::::::::33        66:::::::::66      9::::::9       \n'),   
    write('                        333333333333333            666666666       99999999\n'),
    write('\n\n\n\n').                        
                           
                                                   
 /*                                                  
 333333333333333               66666666       999999999     
3:::::::::::::::33            6::::::6      99:::::::::99   
3::::::33333::::::3          6::::::6     99:::::::::::::99 
3333333     3:::::3         6::::::6     9::::::99999::::::9
            3:::::3        6::::::6      9:::::9     9:::::9
            3:::::3       6::::::6       9:::::9     9:::::9
    33333333:::::3       6::::::6         9:::::99999::::::9
    3:::::::::::3       6::::::::66666     99::::::::::::::9
    33333333:::::3     6::::::::::::::66     99999::::::::9 
            3:::::3    6::::::66666:::::6         9::::::9  
            3:::::3    6:::::6     6:::::6       9::::::9   
            3:::::3    6:::::6     6:::::6      9::::::9    
3333333     3:::::3    6::::::66666::::::6     9::::::9     
3::::::33333::::::3     66:::::::::::::66     9::::::9      
3:::::::::::::::33        66:::::::::66      9::::::9       
 333333333333333            666666666       99999999
 */

% Escolha do tamanho do tabuleiro
%initial_size(-Size)
initial_size(Size):-
    repeat,
        print('Insert Board Size: '),
        read(Size),
    error_size(Size),
    !,
    nl,nl.

% Selecionar o modo do jogo
%select_mode(-Mode)
select_mode(Mode):-
    repeat,
        print('\nSelect game mode: \n\n'),
        write('1 - Player vs Player'), nl,
        write('2 - Player vs Computer'), nl,
        write('3 - Computer vs Computer'), nl,
        read(Mode),
    error_mode(Mode),
    !,
    nl, nl.

% Escolher o nivel do bot
%choose_ai_level(+Mode, [-Level1, -Level2])
choose_ai_level(1, [0, 0]).
choose_ai_level(2, [Level1, 0]):-
    repeat,
        print('\nSelect AI Level from 1 to 2: \n\n'),
        read(Level1),
    error_level(Level1),
    !,
    nl, nl.

choose_ai_level(3, [Level1, Level2]):-
    repeat,
        print('\nSelect AI 1 Level from 1 to 2: \n\n'),
        read(Level1),
    error_level(Level1),
    !,
    repeat,
        print('\nSelect AI 2 Level from 1 to 2: \n\n'),
        read(Level2),
    error_level(Level2),
    !,
    nl, nl.
