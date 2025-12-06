//caso o jogo esteja pausado, ele vai ignorar as proximas linhas
if global.pause{
	alarm [0] = alarm [0] + 1
	speed = 0
	exit
}

//adiciona os valores vezes a velocidade
motion_set(image_angle, velocidade)

#region Teletransporte
	
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
		