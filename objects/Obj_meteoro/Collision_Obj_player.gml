//apago o meteoro que atingiu o player
instance_destroy()

//Enquanto o tempo de invencibilidade não acabou,ignoro os próximos passos
if other.alarm[0] > 0{
	exit
}


//room_restart()

//Diminui a quantidade de vida atual
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
 other.alarm[0] = 5 * 60
 
 //troco o sprite atual do player
 other.sprite_index = spr_DANO