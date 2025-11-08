/*
Criando os botões do jogo
Para isto usaremos as funções keyboard_check e ord()
Explicação no jogo Hello World Sabado Tarde Novo

A partir de hoje usaremos Regions(regiões)
Elas ajudam a deixar o código mais legivel e organizado
Pois podemos deixar alguns temas ou funções relacionados em um mesmo lugar
Para inicialas é só usar 
#region (adiciona nome da região)

#endregion
Para fechar
*/

#region Teclas do player
	//Adicionando as teclas
	
	//Setas
	//Como as setas são "universais", podemos usar o vk e o nome da tecla em inglês
	setaCima = keyboard_check(vk_up)
	setaEsquerda = keyboard_check(vk_left)
	setaDirieta = keyboard_check(vk_right)
	
	//Teclas de letras
	//Como as caracteres de letra mudam de país para país, temos que usar a função ord()
	//Para achar a posiçãom delas no teclado (Lembrando que sempre deve ser em letra maiuscula)
	teclaCima = keyboard_check(ord("W"))
	teclaEsquerda = keyboard_check(ord("A"))
	teclaDireita = keyboard_check(ord("D"))
	
	//Juntar as teclas e as setas com suas parceiras
	//Ou seja, quer eu aperte uma ou a outra, ira dar o mesmo resultado
	andar = setaCima or teclaCima
	
	//Quando apertar  para esquerda ele aumentará o angulo e para direita diminuirá
	girar = + (setaEsquerda or teclaEsquerda) - (setaDirieta or teclaDireita)
	
	/*
	Para fazer o usuario toda hora apertar as teclas de ataque,usaremos a função keyboard_check_pressed()
	que é verdadeiro toda vez que uma tecla é precionada, e diferente do check normal, é que ele só checa se 
	foi pressionada e não se esta sendo pressionada
	
	para checar o mouse,usaremos o mouse_chech_button_pressed() passando o mb_left como parametro,que é
	o botão esquerdo
	*/
	
	//teclas de ataque
	//Enter
	teclaEnter = keyboard_check_pressed(vk_enter)
	
	//barra de espaço
	barraEspaco = keyboard_check_pressed(vk_space)
	
	//Letra Q
	teclaQ = keyboard_check_pressed(ord("Q"))
	
	//botão esquerdo
	botaoEsquerdo = mouse_check_button_pressed(mb_left)
	
	//Variavel que armazena todas as teclas 
	teclaAtaque = teclaEnter or barraEspaco or teclaQ or botaoEsquerdo

#endregion

#region Movimentação
	//Vamos começar pelo mais simples, vamos somar ao algulo o valor que há em girar
	//Ou seja, ele vai aumentar ou diminuir
	
	//Um erro que estava acontecendo é que caso apertemos para a direita com o angulo
	//sendo zero, ele negativava o angulo, fazendo com que a nossa conta não funcionasce
	//E a mmesa coisa acontecia caso apertasse para esquerda e o ângulo passasse de 360
	//Enão agora, caso passe de 360, volta para zero e caso dimuniua abaixo de 0
	//Vai para 355 (último grau antes do zero)
	if image_angle + girar * velocidadeGiro < 0{
		image_angle = 355
	}
	//Para resetar o angulo
	else if image_angle >= 360{
		image_angle = 0
	}
	
	image_angle += girar * velocidadeGiro
	
	
	
	//Nós vamos verificar se eu não estou em um ângulo que ande apenas para um lado
	//Como checaremos isto? Todos os angulos que vão apenas para uma direção
	//São divisiveis por 90, ou seja, divididos por 90 possuem o resultado 0
	
	//Primeiro, vamos verificar esta condição
	
	if image_angle % 90 == 0{
		#region Movimentos "absolutos"
			//Depois de checarmos se é uma direção total, alteramos os valores das variáveis
			//de direção
		
			//Primeiro, se está indo para a direita
			//direita, só pode ser o ângulo 0
			if image_angle == 0{
				//Para a direita, a direcaoHorizontal vai ser 1 positivo
				//E a direcaoVertical vai ser 0
				direcaoVertical = 0
				direcaoHorizontal = velocidade * 2
			}
		
			//180 está indo para esquerda
			else if image_angle == 180{
				//Não desce e nem sobe, ou seja, direcasoVertical vai ser 0
				//E a direcaoHorizontal vai ser -1
				direcaoVertical = 0
				direcaoHorizontal = velocidade * 2
			}
		
			//90 está indo para cima
			else if image_angle == 90{
				//Apenas sobe
				direcaoVertical = -1
				direcaoHorizontal = velocidade * 2
			}
		
			//Só sobrou o 270, que é para baixo
			else{
				//Apenas desce
				direcaoHorizontal = velocidade * 2
				direcaoVertical = 0
			}
			angulo = 0
		#endregion
	}
	
	//Quando o angulo não for divisivel por 90
	else{
		#region Movimentos diagonais
			//Calculo para andar nas diagonais
		
		
			//Aqui nós queremos andar nas diagonais de cada angulo
			//Ou seja, se eu estiver entre dois angulos "absolutos" iremos checar qual é a direção a seguir
			//Calcular a direção
			//Primeiro, iremos pegar o resto da divisão do image_angle por 90, ou seja, ele pode ser
			//Entre 1 a 89 
			angulo = image_angle % 90
			
			//Depois iremos transformar isto em casas decimais
			angulo /= 100 
		
			//Agora, iremos calcular para qaul direção a nave vai
			//Caso o angulo seja menor 180, a nave está subindo
			if image_angle < 180{
				direcaoVertical = -velocidade
			}
		
			//Caso não seja, só pode ser maior, ou seja, está descendo
		
			else{
				direcaoVertical = velocidade
			}
		
			//Agora as direções horizontais
			//Caso seja menor que 90 ou maior que 270, vai para direita
			if image_angle < 90 or image_angle > 270{
				direcaoHorizontal = velocidade
			}
		
			//Cso não seja, só pode ser maior que 90 ou menor que 270, ou seja, vai para esquerda
		
			else if image_angle > 90 or image_angle < 270{
				direcaoHorizontal = -velocidade
			}
		#endregion
	}
	
	//Quando não for divisivel por 90
	
	//Caso precione os botões para cima
	
	//No final, iremos somar o angulo mais 1 e multiplicar pela direção
	if andar{
		/*
		A cada vez que o player apertar para frente,iremos aumentar o valor da propulsão 
		e pior exemplo,caso ele esteja indo para frente e virar ao lado ao contrario,demorara 
		um certo tempo antes de ele voltar a avançar por causa do valor de propulsaõ 
		e caso o player não aperte nenhuma botão ,iremos somar um ou menos um ao valor atual 
		para que ele desacelere sozinho
		*/
		
		// vamos limitar a velocidade do player para o que há em velocidadelimite
		//ou seja, a propulsaõ vai de (atualmente) de 30 a -30
		if propulsaohorizontal  + direcaoHorizontal <= velocidadeLimite and propulsaohorizontal + direcaoHorizontal >= -velocidadeLimite{
			propulsaohorizontal += direcaoHorizontal
		}
		
		/*
		function motion_add(dir: Real, speed: Real) ->
		Undefined
		This function will modify current direction and speed of the instance runing the code, combining the values
		given with the current values.
		dir the added direction.
		speed the added speed.
		
		Tradução
		Função motion_add(dir valor real, spped: real) -> retorno indefinido
		Esta função modificara a direção atual e a velocidade que  da instancia , combinando os valores com os valores atuais 
		dir adiciona a direçaõ
		speed adiciona a velocidade
		*/
		
		  if propulsaoVertical + direcaoVertical <= velocidadeLimite and propulsaoVertical + direcaoVertical >= -velocidadeLimite{
			  propulsaoVertical += direcaoVertical
		  }
	}
	else{
			/*
			para desacelerar o valor que há em propulsaõ ,iremos ultilizar a função sign()
			descrição:
			function returns whether a number is positive,negative or and returns 
			1, -1,0 respetively.
			n the number to get the sign of.
		
			tradução
			função sign (n: valor real) retorno de valor real
			esta função retorna quando um numero é positivo,negativo,ou nenhuma dos dois(0) e retorna 
			1, -1 e 0 respectivamente
			n 0 numero que queira pegar o sinal
		
			ou seja ,vamos verificar se os valores são positivos negativos ou zerados 
			pois assim,quando o player soltar o botão vamos pegar o sinal do numero e multiplicar 
			por -1 ,desta forma ,se o valor for positivo,ele vai somar -1 e quando for negativo
			vai somar 1 fazendo ele desacelerar
			*/
			propulsaohorizontal += sign(propulsaohorizontal) * -0.5
			propulsaoVertical += sign(propulsaoVertical) * -0.5
	}
		/*/jeito antigo de se mover
		x += propulsaohorizontal
		y += propulsaoVertical
		*/
		//Novo jeito usando a propulsão
		//quando apertar para andar
		if andar{
			
			//usa a função motion_add
			motion_add(image_angle, velocidade)
			
			//limita a velocidade
			if speed > velocidadeLimite{
				speed = velocidadeLimite
			}
			
		}
		//se não apertar para ir para frente e esta andando
		else if speed > 0 {
			//soma o valor ao contrario vezes 0.5, ou seja, soma ao contrario a metade do valor
			motion_add(image_angle, -velocidade * 0.5)
		}
			#region Teletransporte
		/*
		o teletransporte funcionara de uma maneira bem simples toda vez que o player sair pelas bordas 
		do jogo teletransportaemos ele para o outro canto
		ou seja
		se ele sair por cima,ele vai para baixo
		se ele sair por baixo,vai para coma 
		se ele sair pela esquerda,ele vai para direita
		se ele sair pela direita ele vai para esquerda
		ok,mas comc poderemos fazer isto
		
		bem simples 
		as cordenadas visiveis ficam entre 0 e o tamenho da sala
		ou seja, na direção horizontal,as coordenadas visiveis ficam entre 0 e a largura da sala 
		e na vertical,ficam entre 0 e a altura da sala
		
		ou seja,
		caso queiramos checar se o player saiu pela esquerda ,qual valor nos checaremos 
		certo,e como queremos checar se saiu pela esquerda ,o x deve ser comparado
		certo,e vamos verificar que ele é maior ou menor que 0? menor
		
		então,caso o x dele seja menor que 0,iremos mandar ele para o outor 
		na largura
		
		a mesma coisa(só que ao contrario) quando ele sair pela direita,no caso
		a largura da tela e vai receber 0, indo para o lado esquerdo
		
		como já verificamos o x,sabemos que só sobrou o Y , ou seja ,quando ele 
		caso o y saia por cima qual valor faremos a comparação,o 0 ou a altura
		ele é menor que 0
		se for,ele vai para o outro lado, ou seja,np valor que há na altura da sala
		
		*/
		
		//saiu pela esquerda
		if x < 0{
			x = room_width
		}
		
		//saiu pela direita
		else if x >  room_width{
			x = 0
		}
		
		//saiu por cima
		if y <0{
			y = room_height
		}
		
		//saiu por baixo
		else if y > room_width{
			y = 0
			}
		
		
#endregion

#region Movimentação
		//Toda vez que apertarmos uma tecla de tiro,iremos criar 1
		if teclaAtaque{
			instance_create_layer(x,y, "instances", Obj_Tiro)
		}
#endregion