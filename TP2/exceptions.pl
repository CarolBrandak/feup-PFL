%error_size(+Size)
error_size(Size):-
    Size >= 6,
    Size =< 9.
error_size(_):-
    print('\nSize must be between 6 and 9 \n').

%error_mode(+Mode):-
error_mode(Mode):-
    Mode >= 1,
    Mode =< 3.
error_mode(_):-
    print('\nMode must be between 1 and 3\n').