/* vimos que ao executar ,certos pontos cegos pelo fato de não nascer meteoros das laterais, para evitarmos 
isto, iremos sortear entre 0 1 a posicao de onde eles vão aparecer, e usar a mesma logica que usamos antes 
alterando apenas o x para y e vice versa

se lembram que true pode ser lido como 1 e flas como 0 ? então, ao inves de armazenarmos um numero
e depois decidir uma operação, iremos colocar um iramdom_range dentro do if entre 0 e 1
caso seja 1, quer dizer que é verdadeiro, e caso seja 0, é falso
*/
if irandom_range(0,1){
	
#region Vindo verticalmente
/*
primeiro, vamos aleatorizar de onde pode vir um meteoro

como queremos que eles aparecam do lado de fora da tela, então sabemos que o x e o 7 devem 
ser menores que 0, ou maiores que as medidas da tela (altura e largura)

para calcular isto, usaremos a função iradom_range()
Descrição:
function iradom_range(n1: Real,n2: Real) Real
n1 The low end of the range from which the random number will be selected.
n2 The high end of the range from which the random number will be selected.

Tradução:
função irandom_range(n1: Real, n2: Real) -> Real
Esta função é semelhante a random_range(), porém com valores inteiros como entrada.
n1 O limite inferior do intervalo a partir do qual o número aleatório será selecionado.
n2 O limite superior do intervalo a partir do qual o número aleatório será selecionado

Então, iremos usar esta função para aleatorizar a posição de onde vai surgir o retorno

primeiro, aleatorizamos o valor do x, que vai ser de -64 até a largura da tela + 64
Depois,iremos aleatorizar o valor de y entre
0 e 1 e depois multiplixaremos pela altura da tela + 128 e depois tiraremos 64
por que faremos isto?
ao multiplicar 0 pela largura da sala, resultará em 0, já se for 1 será a altura da sala mais 128
e ao tirarmos 64, se for zero,aparecerá na altura -64,se for 1,aparecerá na altura da tela + 64
Assim vamos garantir que o meteoro nascera 64 pixels fora da tela 
*/

//Aleatoriza o valor de x
posicaoX = irandom_range(-64, room_width + 64)
posicaoY = irandom_range(0,1) * (room_width + 128) -64

/*
agora que já calcula as posiçãoe iniciais do meteoro,vamos calcular a direção de onde ele deve sair

as direções que devem seguir,sempre devem ser na direçaõ ao contrario de onde apareceram
ou seja, se apareceu na esquerda, deve ir a direita, se apareceu en cima , deve aparecer  em baixo e assim po diante
como ja sabemos que a posisão y do meteor sempre vai ser positiva ou negativa nunca 0, vamos usar uma função
para calcular a direção vertical,iremos usar a função sign
Descrição:
function sign(n: Real) -> Real
This function returns whether a number is positive,negative or neither and returns 1, -1,0 respectively.
n The number to get the sign of.

Tradução:
Função sign(n: valor Real )retorno Real
Esta função retorna quando um numero é positivo ,negativo ou neutro e retorna 1, -1 e 0,respectivamente
n 0 valor para pegar o sinal

ou seja ,se ele apareceu en cima(-64) a funçaõ retorna -1, e se apareceu em baixo (altura da sala +64) retorna1 
assim, o meteoro ira na direção contraria 
*/

direcaoVertical = sign(posicaoY)* -1

/*para a direção horizontal,vai ser um pouco diferente,para calcularmos,iremos pegar a largura da sala +64
e dividir pela metade e depois retira isto da posiçaõ X, assim, caso o meteoro tenha nascido depois da metade 
do valor , quer dizer que ele vira da direita , e  caso seja menor que a metade ,vira da esquerda 
e caso seja exatamente ,vira do meio
como sabemos disto,pois  ao retirar metade do valor ,sabemos que ou vai retira mais que o nescessario
ficando negativo,se retirar tudo,ficara 0, e se retirar mais sobrar algo,quer dizer que vira da direita
*/

direcaoHorizontal = sign(posicaoX - (room_width + 64)) * -1
#endregion
}
else{
#region Vindo horizontalmente 
		//aqui, como falei,vamos trocar as logicas do x para y e vice versa
		//mesma logica da posiçaõ inicial no x
		posicaoX = irandom_range(0,1) * (room_width + 128) - 64
		
		//mesma logica da posição inicial no y
		posicaoY = irandom_range(-64,room_height +64)
		
		//mesma logica da direçaõ horizontal
		direcaoVertical = sign(posicaoY -(room_height + 64)) * -1
		
		//mesma logica da direção vertical
		direcaoHorizontal = sign(posicaoX) * -1
		
		#endregion
}


/*
por fim ,vamos calcular a velocidade ,para isto,usaremos a funçaõ ramdom_range
A diferença é que esta sortea qualquer numero entre o primiro e o ultimo 
até mesmo os numeros decimais que os separam
para manter uma boa velocidade,o valor minimo vai ser 2,e para não ficar muito rapido
o maximo vai ser 5
*/

velocidade = random_range(0.5,3)

//por fim,recebemos as posições no lugar certo
x = posicaoX
y = posicaoY

vida = 10