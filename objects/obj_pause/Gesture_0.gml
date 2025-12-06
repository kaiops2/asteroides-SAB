//mostrar a layer de pausa
//jeito "errado"
/*
if layer_get_visible("menuPAUSE"){
	layer_set_visible("menuPause", false)
}
else{
	layer_set_visible("menupause"), true)
	)
*/
//jeito "certo
layer_set_visible("menuPAUSE", ! layer_get_visible("menuPAUSE"))

global.pause =! global.pause