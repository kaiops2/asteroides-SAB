/*
Criando os botoes do jogo
para isto usaremos as funçoes keybord_check e ord()
explicação no jogo Hello Word sabado tarde novo

a partir de hoje usaremos Regions(regioes)
elas ajudam a deixar o codigo mais legivel e organizado
pois podemdo deixar alguns temas ou funçoes relacionadas em um mesmo lugar
para inicialas é so usar
#region (adicionar nome da região)

#endregion
para fechar
*/

#region teclas do jogo
	//adicionando as teclas
	
	//setas
	//como as setas são "universais ",podemos usar o vk e o nome da tecla em ingles
	setaCima = keyboard_check(vk_up)
	setaEsquerda = keyboard_check(vk_left)
	setaDireita = keyboard_check(vk_right)
	
	//teclas de letras
	//como as caracteres de letra mudam de pais paara pais, temos que usar a função ord()
	//para achar a posição delas no teclado (lembrando que sempre deve ser em latra maiuscula)
	teclaCima = keyboard_check(ord("W"))
	teclaEsquerda = keyboard_check(ord("A"))
	teclaDireita = keyboard_check(ord("D"))
	
	//juntar as teclas e as setas com suas parceiras
	//ou seja,quer eu aperte ou uma ou a outra,ira dar o mesmo resultado
	andar = setaCima or teclaCima
	
	//quando apertar para esquerda ele aumentara o angulo e para direita diminuira
	girar = + (setaEsquerda or teclaEsquerda) - (setaDireita or teclaDireita)
	
#endregion

#region movimentaçaõ
	 //vamos começar pelo mais simples,vamos somar ao valor que háem girar 
	 //ou seja, ele vai aumentar ou diminuir
	 
	 //um erro que estava acontecendo é que caso apertemos para a direita com o angulo
	 //sendo zero,ele negativava o angulo,fazendo com que a nossa conta não funcionasse
	 //e a mesma coisa acontecia caso apertasse para esquerda e o angulo passase de 360
	 //vai para 355 (ultimo grau antes do zero)
	 if image_angle + girar * velocidadeGiro < 0{
		 image_angle = 355
	 }
	 

	 
	 //para resetar o angulo
	 if image_angle >= 360{
		 image_angle = 0
	 }
	 
	 image_angle += girar * velocidadeGiro
	
	 //nos vamos verificar se eu não estou em um angulo que ande apenas para um lado 
	 //como checarmos isto? todos os angulos que vão apenas para uma direção
	 //são divisiveis por 90, ou seja,divisdidos por 90 posuem o resultado 0
	 
	 //primiro,vamos verificar esta condição 
	 if image_angle % 90 == 0{
		#endregion	 
			 #region movimentos "absolutos"
			 //depois de checarmos se é uma direçaõ total,alteramos os valore das variaveis
			 //de direção
	 
			 //primeiro,se está indo para a direita
			 //direita,só pode ser o angulo 0
	 
			 if image_angle == 0{
		 
				 //para a direita, a  direcaoHorizontal vai ser igual a 1 positivo
				 //e a  direcaoVertical vai ser 0
				 direcaoVertical = 0
				 direcaoHorizontal = 1
			 }
	 
			 //180 está indo para esquerda
	 
			else if image_angle == 180{
		 
				 //não desce e nem sobe,ou seja,direçãoVertical vai ser 0
				 //E a direçãohorizontal vai ser -1
		 
				 direcaoVertical = 0
				 direcaoHorizontal = -1
			 }
	 
			 //90 está indo para cima
			else if image_angle == 90{
				//apenas sobe
				direcaoVertical = -1
				direcaoHorizontal = 0
			}
	
			//so sobrou o 270,que é para baixo
			else{
				//apenas desce
				direcaoHorizontal = 0
				direcaoVertical = 1
			}
			angulo = 0
			#endregion
		}
	else{
		direcao
		//quando não for divisivel por 90
		//aqui nós queremos andar nas diagonais de cada angulo
		//ou seja,se eu tiver entre dois angulos "absolutos"iremos checar qual é a direçaõ
		//calcular a direção
		//primeiro,iremos pegar o resto da divisão do image_angle por 90, ou seja,ele pode
		//entre 1 a 89
		angulo = image_angle % 90
		
		angulo /= 100
		
		//agora,iremos calcular para qual direção a nave vai
		//caso o angulo seja menor 180, a nave está subindo
		if image_angle < 180{
			direcaoVertical=1
		}
	
	}
	//caso precione os botoes para cima
	if andar{
		x += direcaoHorizontal
		y +=direcaoVertical
	}
	
#endregion