

%2

%flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

%a)
direct_flight(O, D, Code):-
    flight(O, D,_, Code,_,_)

source_or_dest(N):-
    direct_flight(N, _, _).
source_or_dest(N):-
    direct_flight(_, N, _).

get_all_nodes(L):-
    findall(N, source_or_dest(N), Ns)
    sort(Ns, L).

%c)
find_flights(Ni, Nf, Fs):-
    dfs([Ni], Nf, Fs).

dfs([Nf|_], Nf, []).    
dfs([Ns|T], Nf, [F|Fs]):-
    direct_flight(Na, Nd, F),
    \+member(Nb, [Na|T]), 
    dfs([Nb, Na|T],Nf, Fs).

%d)
find_flights_breadth(Ni, Nf, Fs):-
    get_all_nodes(L), 
    member(Ni, L),
    bfs([[Ni]-[]], Nf, Fs),
    .

bfs([[Nf|_]-Fs|_], Nf, Fs).
bfs([[Na|T]-Fs|Ns], Nf, L):-
    findall([Nb, Na|T]-[F|Fs], (direct_flight(Na, Nb, F), \+member(Nb, [Na|T])), Ns1), 
    append(Ns, Ns1, Ns2), 
    bfs(Ns2, Nf, L).

