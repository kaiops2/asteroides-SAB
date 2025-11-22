/*
aqui iremos usar a função draw_sprite
descrição:
* GM1020-The function 'draw_sprite' takes no less than 4 arguments but 0 are provided.
function draw_sprite(sprite: Asset.GMSprite, subimg: Real, x: Real, y: Real) -> Undefined
This function draws the given sprite and sub-image at a position within the game room.
sprite The index of the sprite to draw.
subimg The sub-image (frame) of the sprite to draw (image_index or -1 correlate to the current frame of animation in the object).
X The x coordinate of where to draw the sprite.
y The y coordinate of where to draw the sprite.

Traduçaõ:
* GM1020 - A função 'draw_sprite' recebe no mínimo 4 argumentos, mas nenhum foi fornecido.
função draw_sprite(sprite: Asset.GMSprite, subimg: Real, x: Real, y: Real) -> Undefined
Esta função desenha o sprite e a subimagem fornecidos em uma posição dentro da sala de jogo.
sprite O índice do sprite a ser desenhado.
subimg A subimagem (quadro) do sprite a ser desenhado (image_index ou -1 correspondem ao quadro atual da animação no objeto).
X A coordenada x de onde desenhar o sprite.
y A coordenada y de onde desenhar o sprite

Ele não diz aqui, mas caso coloque "ali" na sub_image, ele passara por  todos os sprites
*/

//Variavel para realizar a conta desenhar

 idSprite = identificador * 2 - global.quantVida
 
 if idSprite > 2{
	 draw_sprite(spr_vidaplayer,2, x, y)
 }
 else if idSprite <= 0{
	 draw_sprite(spr_vidaplayer,0, x, y)
 }
 else{
	 draw_sprite(spr_vidaplayer, idSprite, x, y)
 }
 