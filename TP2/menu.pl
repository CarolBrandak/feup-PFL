:- include('exceptions.pl').

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

%initial_size(-Size)
initial_size(Size):-
    print('Insert Board Size: '),
    read(Size),
    error_size(Size),
    Size >= 6,
    Size =< 9,
    nl,nl.

%select_mode(-Mode)
select_mode(Mode):-
    print('\nSelect game mode: \n\n'),
    write('1 - Player vs Player'), nl,
    write('2 - Player vs Computer'), nl,
    write('3 - Computer vs Computer'), nl,
    read(Mode),
    error_mode(Mode),
    Mode >= 1,
    Mode =< 3,
    nl, nl.
