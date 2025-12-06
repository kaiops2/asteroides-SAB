//1º método para ir para fase inicial
//room = room_first

//segundo metodo, para ir para primeira fase
//room_goto(0)

//como estamos fazendo teste, pode ser que alternamos as posiçãoes da fase
//então, para ter certeza, vamos receber a fase menu

//quando estiver despausado, ele nao funciona
if ! global.pause{
	exit
}
room = RM_menu
global.idVida = 0