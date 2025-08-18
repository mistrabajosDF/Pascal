Program p3e13;
//A partir de radio y nombre de planetas ingresados por teclado informa
//su diametro y perimetro. Tambien informa si su diametro esta entre la
//tierra y marte y la cantidad con diametro mayor al de Jupiter.
//Finaliza con el radio 0
	Procedure circulo (radio:real; var diametro, perimetro:real);
		begin
			diametro:=radio*2;
			perimetro:=2*3.1415*radio;
		end;
		
	var
		radio, diametro, perimetro, distancia:real; nombre:string; cantidad: integer;
	begin
		write ('Ingrese nombre del planeta:' );
		readln (nombre);
		write ('Ingrese radio en km:' );
		readln (radio);
		write ('Ingrese distancia en anos luz a la tierra:' );
		readln (distancia);
		while (radio<>0) do begin
			diametro:=0;
			perimetro:=0;
			cantidad:=0;
			circulo (radio, diametro, perimetro);
			writeln ('El diametro del circulo es: ', diametro:8:2);
			writeln ('El perimetro del circulo es: ', perimetro:8:2);
			writeln ('======================================================================');
			write ('Ingrese nombre del planeta:' );
			readln (nombre);
			write ('Ingrese radio en km:' );
			readln (radio);
			write ('Ingrese distancia en años luz a la tierra:' );
			readln (distancia);
			if (perimetro>439264) then
				cantidad:=cantidad+1;
			if (diametro <= 12700) and (diametro >=6780) then
				writeln ('Planeta con diametro menor o igual que el de la Tierra y mayor o igual que el de Marte ', nombre, ' distancia: ', distancia);
		end;
		writeln ('======================================================================');
		writeln ('Cantidad de planetas con un perimetro superior al de Jupiter: ', cantidad);
	end.
