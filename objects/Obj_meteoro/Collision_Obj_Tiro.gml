//toda vez que eu colidir com o tiro,diminui a vida em 1
vida--

//caso a vida chegue a 0,destroi o meteoro
if vida == 0{
	instance_destroy()
}
//mostra o tiro acertando
instance_create_layer(other.x, other.y, "Instances" , Obj_DANO)

//destri o tiro
instance_destroy(other)