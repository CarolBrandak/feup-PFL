%score(+Turn, +Board, +Move, +Score1, +Score2, -NewScore1, -NewScore2)
score(0, Board, [RowNumber,ColumnNumber], Score, Score2, NewScore, Score2):-
    length(Board, Size),
    NSize is Size - 1,
    calculate_row(Board, RowNumber, 0, NSize, 0, NPiecesRow),
    %write('\nNPiecesRow  '), write(NPiecesRow),nl,
    calc_score(NPiecesRow, Score, SumScore1),
    calculate_column(Board, ColumnNumber, 0, NSize, 0, NPiecesCol),
    %write('\nNPiecesCol  '), write(NPiecesCol),nl,
    calc_score(NPiecesCol, SumScore1, SumScore2),
    A is min(RowNumber,ColumnNumber),
    RowN is RowNumber - A,
    ColN is ColumnNumber - A,
    calculate_dia1(Board, RowN, ColN, NSize, 0, NPiecesDia1),
    %write('\nNPiecesDia1  '), write(NPiecesDia1),nl,
    calc_score(NPiecesDia1, SumScore2, SumScore3),
    ColInv is NSize - ColumnNumber,
    B is min(RowNumber, ColInv),
    RowNInv is RowNumber - B,
    ColNInv is ColumnNumber + B,
    calculate_dia2(Board, RowNInv, ColNInv, NSize, 0, NPiecesDia2),
    %write('\nNPiecesDia2  '), write(NPiecesDia2),nl,
    calc_score(NPiecesDia2, SumScore3, NewScore).

score(1, Board, [RowNumber,ColumnNumber], Score1, Score, Score1, NewScore):-
    length(Board, Size),
    NSize is Size - 1,
    calculate_row(Board, RowNumber, 0, NSize, 0, NPiecesRow),
    %write('\nNPiecesRow  '), write(NPiecesRow),nl,
    calc_score(NPiecesRow, Score, SumScore1),
    calculate_column(Board, ColumnNumber, 0, NSize, 0, NPiecesCol),
    %write('\nNPiecesCol  '), write(NPiecesCol),nl,
    calc_score(NPiecesCol, SumScore1, SumScore2),
    A is min(RowNumber,ColumnNumber),
    RowN is RowNumber - A,
    ColN is ColumnNumber - A,
    calculate_dia1(Board, RowN, ColN, NSize, 0, NPiecesDia1),
    %write('\nNPiecesDia1  '), write(NPiecesDia1),nl,
    calc_score(NPiecesDia1, SumScore2, SumScore3),
    ColInv is NSize - ColumnNumber,
    B is min(RowNumber, ColInv),
    RowNInv is RowNumber - B,
    ColNInv is ColumnNumber + B,
    calculate_dia2(Board, RowNInv, ColNInv, NSize, 0, NPiecesDia2),
    %write('\nNPiecesDia2  '), write(NPiecesDia2),nl,
    calc_score(NPiecesDia2, SumScore3, NewScore).

%calculate_row(+Board, +RowNumber, +N, +Size, +NPieces, -NewNPieces)
calculate_row(Board, RowNumber, N, N, NPieces, NewNPieces):-
    get_element(Board, RowNumber, N, 1),
    NewNPieces is NPieces + 1.
calculate_row(Board, RowNumber, N, N, NPieces, NPieces):-
    get_element(Board, RowNumber, N, '').

calculate_row(Board, RowNumber, N, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, N, 1),
    NPiecesSum is NPieces + 1,
    NewN is N + 1,
    calculate_row(Board, RowNumber, NewN, Size, NPiecesSum, NewNPieces).
calculate_row(Board, RowNumber, N, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, N, ''),
    NewN is N + 1,
    calculate_row(Board, RowNumber, NewN, Size, NPieces, NewNPieces).

%calculate_column(+Board, +ColNumber, +N, +Size, +NPieces, -NewNPieces)
calculate_column(Board, ColNumber, N, N, NPieces, NewNPieces):-
    get_element(Board, N, ColNumber, 1),
    NewNPieces is NPieces + 1.
calculate_column(Board, ColNumber, N, N, NPieces, NPieces):-
    get_element(Board, N, ColNumber, '').

calculate_column(Board, ColNumber, N, Size, NPieces, NewNPieces):-
    get_element(Board, N, ColNumber, 1),
    NPiecesSum is NPieces + 1,
    NewN is N + 1,
    calculate_column(Board, ColNumber, NewN, Size, NPiecesSum, NewNPieces).
calculate_column(Board, ColNumber, N, Size, NPieces, NewNPieces):-
    get_element(Board, N, ColNumber, ''),
    NewN is N + 1,
    calculate_column(Board, ColNumber, NewN, Size, NPieces, NewNPieces).

%calculate_dia1(+Board, +RowNumber, +ColNumber, +Size, +NPieces, -NewNPieces)
calculate_dia1(Board, RowNumber, N, N, NPieces, NewNPieces):-
    get_element(Board, RowNumber, N, 1),
    NewNPieces is NPieces + 1.
calculate_dia1(Board, RowNumber, N, N, NPieces, NPieces):-
    get_element(Board, RowNumber, N, '').

calculate_dia1(Board, N, ColNumber, N, NPieces, NewNPieces):-
    get_element(Board, N, ColNumber, 1),
    NewNPieces is NPieces + 1.
calculate_dia1(Board, N, ColNumber, N, NPieces, NPieces):-
    get_element(Board, N, ColNumber, '').



calculate_dia1(Board, RowNumber, ColNumber, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, ColNumber, 1),
    NPiecesSum is NPieces + 1,
    NewRow is RowNumber + 1,
    NewCol is ColNumber + 1,
    calculate_dia1(Board, NewRow, NewCol, Size, NPiecesSum, NewNPieces).
calculate_dia1(Board, RowNumber, ColNumber, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, ColNumber, ''),
    NewRow is RowNumber + 1,
    NewCol is ColNumber + 1,
    calculate_dia1(Board, NewRow, NewCol, Size, NPieces, NewNPieces).

%calculate_dia2(+Board, +RowNumber, +ColNumber, +Size, +NPieces, -NewNPieces)
calculate_dia2(Board, RowNumber, 0, _, NPieces, NewNPieces):-
    get_element(Board, RowNumber, 0, 1),
    NewNPieces is NPieces + 1.
calculate_dia2(Board, RowNumber, 0, _, NPieces, NPieces):-
    get_element(Board, RowNumber, 0, '').

calculate_dia2(Board, N, ColNumber, N, NPieces, NewNPieces):-
    get_element(Board, N, ColNumber, 1),
    NewNPieces is NPieces + 1.
calculate_dia2(Board, N, ColNumber, N, NPieces, NPieces):-
    get_element(Board, N, ColNumber, '').



calculate_dia2(Board, RowNumber, ColNumber, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, ColNumber, 1),
    NPiecesSum is NPieces + 1,
    NewRow is RowNumber + 1,
    NewCol is ColNumber - 1,
    calculate_dia2(Board, NewRow, NewCol, Size, NPiecesSum, NewNPieces).
calculate_dia2(Board, RowNumber, ColNumber, Size, NPieces, NewNPieces):-
    get_element(Board, RowNumber, ColNumber, ''),
    NewRow is RowNumber + 1,
    NewCol is ColNumber - 1,
    calculate_dia2(Board, NewRow, NewCol, Size, NPieces, NewNPieces).

%calc_score(+NPieces, +Score, -NewScore)
calc_score(NPieces, Score, Score):-
    ModPiece is NPieces mod 3,
    dif(ModPiece, 0).
calc_score(NPieces, Score, NewScore):-
    TempScore is NPieces div 3,
    NewScore is Score + TempScore.
