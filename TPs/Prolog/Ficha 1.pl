% 1.
% a)
male(frank).
male(jay).
male(javier).
male(merle).
male(phil).
male(mitchell).
male(cameron). % Example of a homosexual relationship. This affects how we define siblings!
male(joe).
male(manny).
male(bo).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).

female(grace).
female(dede).
female(gloria).
female(barb).
female(claire).
female(pameron).
female(haley).
female(alex).
female(lily).
female(poppy).

parent(grace,phil).
parent(frank,phil).

parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).

parent(jay,joe).
parent(gloria,joe).

parent(gloria,manny).
parent(javier,manny).

parent(barb,cameron).
parent(merle,cameron).
parent(barb,pameron).
parent(merle,pameron).

% ... The next facts for parent/2 correspond to the children of phil and claire

parent(phil, haley).
parent(phil, alex).
parent(phil, luke).
parent(claire, haley).
parent(claire, alex).
parent(claire, luke).

parent(mitchell, lily).
parent(mitchell, rexford).
parent(cameron, lily).
parent(cameron, rexford).

parent(pameron, calhoun).
parent(bo, calhoun).

parent(dylan, george).
parent(haley, george).
parent(dylan, poppy).
parent(haley, poppy).

% c)
father(X,Y):-
    male(X),
    parent(X,Y).

grandparent(X,Y):-
    parent(Parent,Y),
    parent(X,Parent).

grandmother(X,Y):-
    female(X),
    grandparent(X,Y).

siblings(X,Y):-
    parent(A,X),
    parent(A,Y),
    parent(Z,X),
    parent(Z,Y),
    X\=Y,
    A@<Z.

%...

% e)
%married(Person1,Person2,Year).
married(jay,gloria,2008).
married(jay,dede,1968).

divorced(jay,dede,2003).

%is_married(+X,?Y,+Year)
is_married(X,Y,Year):-
    married(X,Y,Year1),
    Year >= Year1,
    \+divorced(X,Y,_).

is_married(X,Y,Year):-
    married(X,Y,Year1),
    Year >= Year1,
    divorced(X,Y,Year2),
    Year =< Year2.

% 2.
% professor leciona cadeira
leciona("Algoritmos","Adalberto").
leciona("Base De Dados","Bernardete").
leciona("Estatistica","Diogenes").
leciona("Redes","Ermelinda").

% Aluno frequenta cadeira
frequenta("Algoritmos","Alberto").
frequenta("Algoritmos","Bruna").
frequenta("Algoritmos","Cristina").
frequenta("Algoritmos","Diogo").
frequenta("Algoritmos","Eduarda").
frequenta("Base De Dados","Antonio").
frequenta("Base De Dados","Bruno").
frequenta("Base De Dados","Cristina").
frequenta("Base De Dados","Duarte").
frequenta("Base De Dados","Eduardo").
frequenta("Compiladores","Alberto").
frequenta("Compiladores","Bernardo").
frequenta("Compiladores","Clara").
frequenta("Compiladores","Diana").
frequenta("Compiladores","Eurico").
frequenta("Estatistica","Antonio").
frequenta("Estatistica","Bruna").
frequenta("Estatistica","Claudio").
frequenta("Estatistica","Duarte").
frequenta("Estatistica","Eva").
frequenta("Redes","Alvaro").
frequenta("Redes","Beatriz").
frequenta("Redes","Claudio").
frequenta("Redes","Diana").
frequenta("Redes","Eduardo").

% b)
% i) leciona(X,"Diógenes").
% ii)leciona(X,"Felismina").
% iii)frequenta(X,"Cláudio").
% iv)frequenta(X,"Dalmindo").
% v)leciona(Z,"Bernardete"),frequenta(Z,"Eduarda").
% vi)frequenta(X,"Alberto"),frequenta(X,"Álvaro").

% c)
% i) 
aluno(X,Y):- 
    leciona(Z,Y), 
    frequenta(Z,X).

% ii)
professor(X,Y):- 
    aluno(Y,X).

% iii) 
professoresDe(X):- 
    aluno(X,Y).

% iv) 
alunosDeEDe(X,Y):- 
    aluno(Z,X) ,
    aluno(Z,Y).

% v)
colegas(X,Y):- 
    leciona(_,X) , 
    leciona(_,Y), 
    Y\=X.
colegas(X,Y):- 
    aluno(X,Z), 
    aluno(Y,Z), 
    Y\=X.

% vi) 
maisDeUmaUC(X):- 
    frequenta(UC,X) , 
    frequenta(UC1,X), 
    UC\=UC1.

% 3.
% a)
% X is a pilot
pilot("Lamb").
pilot("Besenyei").
pilot("Chambliss").
pilot("MacLean").
pilot("Mangold").
pilot("Jones").
pilot("Bonhomme").

% X is in the Y team
team("Lamb","Breitling").
team("Besenyei","Red Bull").
team("Chambliss","Red Bull").
team("MacLean","Mediterranean Racing Team").
team("Mangold","Cobra").
team("Jones","Matador").
team("Bonhomme","Matador").

% X's plane is a Y
plane("Lamb","MX2").
plane("Besenyei","Edge540").
plane("Chambliss","Edge540").
plane("MacLean","Edge540").
plane("Mangold","Edge540").
plane("Jones","Edge540").
plane("Bonhomme","Edge540").

% X is a circuit
circuit("Istanbul").
circuit("Budapest").
circuit("Porto").

% Pilot X Won circuit Y
winner("Jones","Porto").
winner("Mangold","Budapest").
winner("Mangold","Istanbul").

% circuit X has y gates
gates("Istanbul",9).
gates("Budapest",6).
gates("Porto",5).

% Team Team won race Circuit
teamWinner(Team,Circuit) :- 
    team(Pilot,Team),
    winner(Pilot,Circuit).

% b)
% i) winner(Piloto,"Porto").
% ii) teamWinner(Team,"Porto).
% iii) gates(Y,X), X > 8.
% iv) plane(X,Y),Y\="Edge540"
% v)  winner(X,Z),winner(X,Z1),Z\=Z1
% vi) plane(Pilot,Plane),winner(Pilot,"Porto").

% 4.
traduz(1, 'Integer Overflow').
traduz(2, 'Divisao por zero').
traduz(3, 'ID Desconhecido').

% 5.
cargo(tecnico, eleuterio).
cargo(tecnico, juvenaldo).
cargo(analista, leonilde).
cargo(analista, marciliano).
cargo(engenheiro, osvaldo).
cargo(engenheiro, porfirio).
cargo(engenheiro, reginaldo).
cargo(supervisor, sisnando).
cargo(supervisor_chefe, gertrudes).
cargo(secretaria_exec, felismina).
cargo(diretor, asdrubal).

chefiado_por(tecnico, engenheiro).
chefiado_por(engenheiro, supervisor).
chefiado_por(analista, supervisor).
chefiado_por(supervisor, supervisor_chefe).
chefiado_por(supervisor_chefe, diretor).
chefiado_por(secretaria_exec, diretor).

% a)
% i. O cargo do sisnando que é chefiado por um analista
% ii. Os cargos que chefeiam tecnico e que são chefiados por outros cargos
% iii. Os cargos são chefiados por um supervisor  e as pessoas que tem esse cargo 
% iv. Os cargos chefiados pelo diretor e que não sejam ocupados pela felismina

% b)
% i. supervisor
% ii. X=engenheiro    Y=supervisor
% iii. J=analista     P=leonilde
% iv. gertrudes

% c)
% i. 
chefe(X, Y):-
    cargo(X1, X),
    cargo(Y1, Y),
    chefiado_por(X1, Y1).

% ii.
chefesDoMesmoCargo(X, Y):-
    chefe(X1, X),
    chefe(Y1, Y),
    cargo(C, X1),
    cargi(C, Y1).

% iii.
cargosSemOutrosCargos(X):-
    cargo(X,_),
    \+ chefiado_por(_,X).

% iv.
semChefe(X):-
    cargo(X,_),
    \+ chefiado_por(X,_).

% 6.
pairs(X, Y):- d(X), q(Y).
pairs(X, X):- u(X).
u(1).
d(2).
d(4).
q(4).
q(16).

% a) 
% X = 2,  Y = 4
% X = 2,  Y = 16
% X = 4,  Y = 4
% X = 4,  Y = 16
% X = 1 , Y = 1

% 7.
a(a1, 1).
a(A2, 2).
a(a3, N).
b(1, b1).
b(2, B2).
b(N, b3).
c(X, Y):- 
    a(X, Z), 
    b(Z, Y).
d(X, Y):- 
    a(X, Z), 
    b(Y, Z).
d(X, Y):- 
    a(Z, X), 
    b(Z, Y).

% a)
% i. true
% ii. false
% iii. A=a3
% iv. A = a1 , B = b1
%     A = a1, B = b3
%     A = a3 , B = b3
% v. X = Qualquer coisa, Y = b3
%    X = 2 , Y = qualquer coisa