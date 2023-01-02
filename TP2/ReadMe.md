### Indentificação do trabalho e do grupo:
##### Jogo: 
369_5 turma 10 
##### Contribuição:
* Ana Carolina Araújo Marques de Brito Brandão (up202004461) - 50% <br>
* Jorge Levi Perdigoto da Costa (up201706518) - 50%

### Instalação e Execução:
1. Abrir o programa SICStus (Versão testada: 4.7.1)
2. Alterar a font para MS Gothic e o tamanho de letra para 12 (Settings->Font->selecionar MS Gothic e 12)
3. Fazer consult do ficheiro `main.pl`
4. Executar o predicado `play.`

### Descrição do jogo:

O **369** é um jogo de tabuleiro para 2 jogadores, jogado num tabuleirode qualquer tamanho entre `3x3` e `18x18`, inicialmente vazio. Os jogadores, colocam, cada um na sua vez, uma peça em cada vertíces das quadrículas, o jogo acaba quando o tabuleiro fica completamente cheio. Ganha o jogador que tiver mais pontos.

Regras:
* Se houver 3 peças na mesma linha (ortogonal e diagonal) ganha 1 ponto.
* Se houver 6 peças na mesma linha (ortogonal e diagonal) ganha 2 ponto.
* Se houver 9 peças na mesma linha (ortogonal e diagonal) ganha 3 ponto.

Adicionámos uma funcinalidade que permite calcurar pontos para qualquer tamanho de tabuleiro, isto é, o jogador recebe n pontos quando faz uma linha com n * 3 peças.

### Lógica do Jogo:
#### Representação interna do estado do jogo:
 
Cada um dos estados tem um predicado que representa a atual `board`
##### Estado Inicial
```prolog
initial([
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', '']
]).
```

##### Estado Intermédio
```prolog
mid([
    [1 , '', '', '', '', ''],
    ['', '', '', '', '', 1 ],
    ['', '', 1 , '', '', ''],
    [1 , '', '', '', '', ''],
    ['', '', '', '', 1 , ''],
    ['', 1 , '', '', '', '']
]).
```

##### Estado Final
```prolog
final([
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1, 1]
]).
```

#### Visualização do estado de jogo

O programa é inciado por play/0, demonstrando em seguida um menu, este pedindo o size do Board e o tipo de jogo: Player vs Player, Player vs Computer, Computer vs Computer. Dependendo do tipo de jogo, pede o nível de jogo do Computador (1 e 2), sendo que no nível 1 o Computador faz jogadas random, e no nível 2 faz jogadas inteligentes.


##### Menu

![menu](https://user-images.githubusercontent.com/80838413/210232330-f59bbef6-a2f9-4267-94a9-0d42aed4e0bf.png)

##### Estado Inicial

![inicial](https://user-images.githubusercontent.com/80838413/210233516-9422b7ed-a65e-4969-b9c3-b52ae9e6aee6.png)

##### Estado Intermédio

![intermedio](https://user-images.githubusercontent.com/80838413/210233561-45054617-647a-4c04-98a4-6d75fb2291c7.png)

##### Estado Final

![final](https://user-images.githubusercontent.com/80838413/210233611-7d07c1c5-5f5e-4b49-b997-7228f8fb8a05.png)

#### Execução de Jogadas:

A jogada é executada através do predicado move/3 que recebe o Estado do Jogo atual, um Move em forma de [linha, coluna] e devolve o novo Estado de Jogo com o elemento do tabuleiro alterado nessa linha e coluna.
Este predicado apenas é efetuado quando o move está na lista de jogadas possiveis.

#### Lista de Jogadas Válidas:

O predicado `valid_moves/2` devolve, através de ListOfMoves, a lista de jogadas válidas para avançar um dado GameState, recorrendo ao `findall/3`.

#### Final do Jogo:

A nossa função de verificação de final do jogo está dividida em duas: `check_game_over/2` que recebe o GameState e verifica se ha jogadas válidas e retorna um valor chamado State, que faz com que termine o ciclo de jogo; e `game_over/2` que recebe o score do Player 1 e o score do Player 2 e determina o vencedor.

Foi necessário efetuar as operações deste modo pois pela lógica de jogo, não é possível determinar o vencedor/pontuação apenas com o Estado de Jogo final, mas sim é necessário calcular a pontuação depois de cada jogada.

#### Avaliação do Tabuleiro:

É possível verificar quais as jogadas que possuem maior valor através do predicado `value/3`. Esse predicado recebe o Estado de Jogo, a lista de jogadas válidas, e devolve uma lista de scores com índice equivalente ao índice da respetiva jogada. Essa lista é usada no predicado `max_score_list/6`, que retorna uma lista com os índices de maior score. Esta operação foi feita desta forma de modo a esperar um número diferente de jogadas com maior valor, e assim escolher uma dessas jogadas aleatóriamente.

#### Jogada do Computador:

O computador escolhe a sua jogada recorrendo ao predicado `choose_move/3`. Existem duas opções para o nível de dificuldade:

1. Escolhe uma jogada válida aleatória recorrendo ao módulo random.
2. Escolhe a jogada que dá maior pontuação no momento.

### Conclução:

Todos os objetivos principais do trabalho foram cumpridos e a sua execução foi bem conseguida, respeitando todas as regras.
Para tornar o jogo mais dinâmico, foi implementada uma funcionalidade que permite calcular os pontos com qualquer tamanho de tabuleiro e número de peças em linha caso este número seja múltiplo de 3.
Tentámos empregar boas práticas de prolog durante a realização do código e tentámos respeitar ao máximo a estrutura indicada, tendo sido impossível de implementar alguns predicados da maneira explícita devido à própria lógica de jogo.
Foram aprofundados diversos conhecimentos relativamente à programação funcional e recursiva, devido aos desafios impostos pelos predicados value e display_game.
Foi de notar que graças à estrutura imposta, a realização do trabalho tornou-se mais simples e organizada.
Não foi implementada a funcionalidade de ser possível de realizar input de valores sem necessidade de usar ponto(.).
Em suma ficámos muito satisfeitos com o aspecto visual do trabalho e com a estrutura de código.

### Bibliografia:

* http://asciivalue.com/
* https://www.swi-prolog.org/