Program DolaresBanco;

	//Recibe por teclado una cantidad de dolares, un precio por estos y un % de comisión
	//En base a esto calcula el costo total de la operación
	var 
		dolares, preciodolar, porcentaje, costosinporcentaje, costopor, costofinal:real;
	begin
		write ('Ingrese cantidad de dolares: ');
		read (dolares);
		write ('Ingrese precio del dolar: ');
		read (preciodolar);
		write ('Ingrese porcentaje de comision: ');
		read (porcentaje);
		costosinporcentaje:= preciodolar*dolares;
		costopor:=costosinporcentaje/100*porcentaje;
		costofinal:=costosinporcentaje+costopor;
		write ('El costo final por esta operacion es: ', costofinal:8:2, ' pesos.');
	end.

