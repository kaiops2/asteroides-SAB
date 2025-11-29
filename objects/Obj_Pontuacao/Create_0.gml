//vai carregar os dados salvos,consecutivamente carregando a maior pontuação
if !variable_global_exists("MaiorPontuacao"){
	global.maiorPontuacao = 0
}

//Carregar os dados salvos do jogo
carregarJogo()