Program P0E4;

//A partir de un diametro ingresado por teclado, calcula e imprime radio, area y perimetro de un circulo

	var
		diametro, radio, area, perimetro, pi:real;
	begin
		pi:= 3.1415;
		write ('Ingrese diametro del circulo: ');
		read (diametro);
		radio:= diametro/2;
		area:= radio*radio*pi;
		perimetro:= diametro*pi;
		writeln ('El radio del circulo es: ', radio:8:2);
		writeln ('Su area es: ', area:8:2);
		writeln ('Su perimetro es: ', perimetro:8:2);
	end.
