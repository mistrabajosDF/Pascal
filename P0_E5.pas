Program Caramelo;

	//Calcula cuantos caramelos le tocan a cada cliente si todos deben llevar la misma cantidad
	//El resto se los queda el kioskero
	//Se calcula la ganancia considerando los caramelos vendidos y un precio de 1,60 por caramelo
	
	var
		caramelos, clientes, carkios, carclien, totalganancia:integer; t2:real;
	
	begin
		t2:= 0;
		write ('Ingrese cantidad de caramelos: ');
		read (caramelos);
		write ('Ingrese cantidad de clientes: ');
		read (clientes);
		carclien:= caramelos DIV clientes;
		carkios:= caramelos MOD clientes;
		totalganancia:= clientes*carclien;
		t2:= totalganancia * 1.6;
		writeln ('Cada cliente tendra ', carclien, ' caramelos.');
		writeln ('El kiosquero tendra ', carkios, ' caramelos.');
		writeln ('El kiosquero ganara ', t2:1:2, ' pesos por la venta de caramelos.');
	end.
