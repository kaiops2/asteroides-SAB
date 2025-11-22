//Criando um indentificador para cada vida

//se a variavel global "idVida" existir
if variable_global_exists("idVida"){
	//Aumenta o valor interno em 1
	global.idVida ++
}
//e caso não exista
else{
	//Inicio o valor dela em 1
	global.idVida = 1
}

//Crio uma variavel interna que armazena o valor que há na variavel idVida quando a instancia for criada
identificador = global.idVida 