//room_restart()

 global.quantVida--
 
 if global.quantVida == 0{
	 //mostra que o player perdeu e salva se ele tiver a maior quantidade de pontos
 }
 
 else if global.quantVida % 2 == 0{
	 //manda o player pro meio da sala
	 
	 other.x = room_width / 2
	 other.y = room_height / 2
 }
 //cria o tempo de invencibilidade