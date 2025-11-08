/*
assim que ele surgir,vamos ativar o alarm

Alarm são eventos que, ao receber um valor, o decrementão (diminui em 1 o valor) a cada frame, e quando chegar no 0
executarão o comando que há dentro dele

ou seja,se um alarm receber 60 quer dizer que ele vai demorar 60 frames  por segundo
para ver a quantidade de frames por segundo uqe há no jogo,basta ir em comfiguração

outra coisa tambem é que ele funciona como vetor, ou seja ,temos que indicar que posição do alarm queremos
utilizar

no nosso caso, queremos uque no alarm 0, 5 segundos após ser criado, o tiro deve desaparecer

como monatr este codigo ?
*/

alarm[0] = 60 * 2

//Assim que for criado,vai ir na direção que a nave esta´apontando
direcaoVertical = Obj_player.direcaoVertical
direcaoHorizontal = Obj_player.direcaoHorizontal

//fica com a imagem no mesmo angulo do player 
image_angle = Obj_player.image_angle

//Velocidade que vai viajar
velocidade = 15