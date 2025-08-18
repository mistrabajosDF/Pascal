Program soja;

	Procedure rendi (hectareas, tipo, precio:integer; var rendimiento: real);
		var
			rendtip:real;
		begin
			rendtip:=0;
			if (tipo=1) then
				rendtip:=6;
			if (tipo=2) then
				rendtip:=2.6;
			if (tipo=3) then
				rendtip:=1.4;
			rendimiento:=hectareas*rendtip*precio;
		end;

	var
		hectareas, tipo, precio:integer; rendimiento: real;

	begin
		write ('Ingrese cantidad de hectareas sembradas: ');
		readln (hectareas);
		write ('Ingrese tipo de zona: ');
		readln (tipo);
		write ('Ingrese precio en dolares de la tonelada: ');
		readln (precio);
		rendi (hectareas, tipo, precio, rendimiento);
		writeln ('El rendimiento es:', rendimiento:10:2);
	end.
