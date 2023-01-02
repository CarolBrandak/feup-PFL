%error_size(+Size)
error_size(Size):-
    Size >= 3,
    Size =< 18,
    write('\nSucess Size!\n').

%error_mode(+Mode):-
error_mode(Mode):-
    Mode >= 1,
    Mode =< 3,
    write('\nSucess Mode!\n').

%error_level(+Level):-
error_level(Level):-
    Level >= 1,
    Level =< 2,
    write('\nSucess Level!\n').
