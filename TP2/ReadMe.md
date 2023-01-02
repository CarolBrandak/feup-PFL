### Indentificação do trabalho e do grupo:
##### Jogo: 
369_5 turma 10 
##### Conribuição:
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
* Se houver 3 pechas na mesma linha (ortogonal e diagonal) ganha 1 ponto.
* Se houver 6 pechas na mesma linha (ortogonal e diagonal) ganha 2 ponto.
* Se houver 9 pechas na mesma linha (ortogonal e diagonal) ganha 3 ponto.

### Lógica do Jogo:
#### Representação interna do estado do jogo:
