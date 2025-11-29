//Função para mostrar "0s" na frente do  numero caso o valor não atinja 100 mil
function mostrarZeros(numeros){
	//recebe o numero convertido para texto 
	textoAdaptado = string(numeros)
	
	//caso o tamanho do texto seja menor do que  2 (numeros menores que 10)
	if string_length(textoAdaptado) < 2 {
		//coloca 5 zeros na frente
		textoAdaptado = "00000" + string(numeros)
	}
	
	//caso o tamanho do texto seja menor do que  3 (numeros menores que 100)
	else if string_length(textoAdaptado) < 3 {
		//coloca 4 zeros na frente
		textoAdaptado = "0000" + string(numeros)
	}
	
	//caso o tamanho do texto seja menor do que  4 (numeros menores que 1000)
	else if string_length(textoAdaptado) < 4 {
		//coloca 3 zeros na frente
		textoAdaptado = "000" + string(numeros)
	}
	
	//caso o tamanho do texto seja menor do que  5 (numeros menores que 10000)
	else if string_length(textoAdaptado) < 5 {
		//coloca 2 zeros na frente
		textoAdaptado = "00" + string(numeros)
	}
	
	//caso o tamanho do texto seja menor do que  6 (numeros menores que 100000)
	else if string_length(textoAdaptado) < 6 {
		//coloca 1 zeros na frente
		textoAdaptado = "0" + string(numeros)
	}
	
	//Não preciso colocar mais um zero pois o valor é no minimo 100 mil, não preciso mostra-lo
	
	//no fim do codigo, eu retorno o texto corrigido
	return textoAdaptado
}