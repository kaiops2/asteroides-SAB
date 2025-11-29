/*nos queremos ao criar ele a partir de meteoros grandes
primiro,vamos aleatorizar se ao destruir, qual direção ele vai,esquerda ou direita, cima ou baixo
*/

//para ser -1 caso seja zero,miultiplicarmos o valor por 2 e depois retirarmos 1, se for 1,fica 2 -1,se for 0
//fica 0 - 1
direcaoVertical = irandom_range(0,1) * 2 -1
direcaoHorizontal = irandom_range(0,1) * 2 - 1

//A velocidade vai ser bem baixa
velocidade = random_range(0.01,1)

//tem a metade da vida do meteoro grande
vida = 2