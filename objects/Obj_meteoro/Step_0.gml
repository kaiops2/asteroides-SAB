/*
Aqui por enquanto é simples ,basta apenas adicionarmos os valores da direçaõ vezes a velocidade
*/

x += direcaoHorizontal * velocidade
y += direcaoVertical * velocidade

/*
agora que já funcionou ,vamos programar para quando elas forem destruidas (seja por que saiu da tela )ou por ter sido
acertada pelo player ), vamos criar um outra 

para calcularmos se ela saiu da tela ,é simples ,pois é só pegarmos de onde ela veio e depois verificar
se ela saiu da esquerda, o valor que há na direcao\horizontal é 1 positivo,então ,basta checarmos
se o x é maior que a largura da sala ,se só nos basearmos pelo tamanho da sala, antes de sair completamente
ela vai sair quando tiver passado só a metade da image ,por isto,sempre soaremos ou subtrairemos 64 tanto da 
altura, quanto da largura
então,se direcaoHorizontal seja positiva e o x seja maior que o tamanho da sala +64
Ou,se a direçãoHorizontal seja negativa e o x seja menor que -64
ou,se a direcaoVertical seja positiva e o y maior que a altura da sala +64
ou,se a direcaoVertical seja negativa e o y menor que -64
Destruiremos esta instancia
assim como na matematica, as operaçoes que estão dentro do parenteses,saõ realizadas antes do que das operações
Do lado de fora 
Então nossa estrutura do if ficara assim 
Condição == cd
if (cd1 and cd2) or (cd3 and cd4) or (cd5 and cd6) or (cd7 and cd8){
	instance_destroy ()
}
por que faremos isto ao inves de fazer tudo fora do parentes ? pois as condiçãoes internas usam and 
Ou seja, as duas condiçoes são verdadeiro, no nosso caso, por exemplo , a direçaõ tem que  ser positiva e a posição 
tem que ser maior 
E as comdições externas precisa de apenas uma ser verdadeira, ou saiu  pela esquerda ou saiu pela direita 
ou saiu por cima ou saiu 
por baixo
*/
if (direcaoHorizontal == 1 and x > room_width + 64 ) or (direcaoHorizontal == -1 and x < -64) or
	(direcaoVertical == 1 and y > room_width + 64 ) or (direcaoVertical == -1 and y < -64){
		instance_destroy()
	}