if global.quantpontos > global.maiorPontuacao{
	//Reeceber o maior valor
	global.maiorPontuacao = global.quantpontos
	
	//Salva a maior pontuação
	salvarJogo()
}

//Para alinhar,iremos usar a função draw_set_hallign()
draw_set_halign(fa_left)

//primeiro mostrar a pontuação atual
draw_text(x,y,      "Pontuacao:       " +    mostrarZeros(global.quantpontos))

//Embaixo,mostra a maior pontuaçaõ 
draw_text(x,y + 10, "Maior Pontuacao: " + mostrarZeros(global.maiorPontuacao))