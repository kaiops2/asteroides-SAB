//função para salva o jogo
//passar o nome do jogo é opcional
function salvarJogo(nomeArquivo = "saveJogo.ini"){
	//abrir o caderno (no nosso caso, o arquivo)
	ini_open(nomeArquivo)
	
	ini_write_real("Pontuacao", "Maior Pontuacao", global.maiorPontuacao)
	
	ini_close()
}

//Função para carregar o jogo
//Passar o nome do jogo é opcional
 function carregarJogo(nomeArquivo = "saveJogo.ini"){
	 //Abrir o caderno (no nosso caso, o arquvo)
	 ini_open(nomeArquivo)
	 
	 global.maiorPontuacao = ini_read_real("Pontuacao", "Maior Pontuacao", 500)
	 
	 //feche o "caderno"
	 ini_close()
 }
 	/*
	Agora, vamos chamar as funções em seus repectitivos lugares
	*********Detalhe, caso queira ver o arquivo criado basta ir em (lembrando que o que está
				em parenteses é ára ser subistituido):
	C:\Users\SeuUsuario\AppData\Local\NomeDoJogo
	Disco local -> Usuários -> (Seu Usuário) -> AppData -> Local -> (Nome do seu jogo)
	E abrir o arquivo com o nome do arquivo que você definiu
	
	Se não achar, basta abrir o cmd e digitar o seguinte comando
	cd C:\Users\(Seu Usuario)\AppData\Local\(NomeDoJogo) 
	E depois digitar
	(nome do arquivo) open
	
	E agora, toda vez que chamar esta função, mesmo que o jogo tenha sido fechado, ele ainda
	Vai conseguir buscar os dados salvos se achar o Arquivo e o caminho.
	*/