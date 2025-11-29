//caso a vida chegue a zero
if vida <= 0{
	
	//criar dois meteoros menores
	instance_create_layer(x,y, "Instances", Obj_meteoroBABY)
	
	//Recebe 20 pontos
	global.quantpontos += 20
}

	