% Verifica se o tamanho do tabuleiro está entre 3 e 18
%error_size(+Size)
error_size(Size):-
    Size >= 3,
    Size =< 18,
    write('\nSucess Size!\n').

% Verifica se o modo selecionado está entre 1 e 3
%error_mode(+Mode):-
error_mode(Mode):-
    Mode >= 1,
    Mode =< 3,
    write('\nSucess Mode!\n').

% Verifica se o nivel selecionado está entre 1 e 2
%error_level(+Level):-
error_level(Level):-
    Level >= 1,
    Level =< 2,
    write('\nSucess Level!\n').
