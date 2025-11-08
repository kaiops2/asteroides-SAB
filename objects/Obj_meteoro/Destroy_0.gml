//toda vez que uma pedra grande seja destruida,iremos recria-la
instance_create_layer(x,y, "Instances", Obj_meteoro)

//caso a vida chegue a zero
if vida == 0{
	
	//criar dois meteoros menores
	instance_create_layer(x,y, "Instances", Obj_meteoroMini)
	instance_create_layer(x,y, "Instances", Obj_meteoroMini)
}

	