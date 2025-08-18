Program arba;
//A partir de una cantidad de hectareas, en un lugar con un tipo de zona
//calcula su rendimiento. Al finalizar informa los campos de mayor y menor
//rendimiento y los de 3 de febrero con rendimiento superior a 10mil dolares
//La carga finaliza con la localidad de Saladillo y 900 ha
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
		hectareas, tipo, precio, canttresf:integer; 
		rendimin, rendimax, rendimiento: real; 
		localidad, locamax, locamin: string;

	begin
		rendimax:=0;
		rendimin:=90000;
		canttresf:=0;
		repeat 
			write ('Ingrese localidad: ');
			readln (localidad);
			write ('Ingrese cantidad de hectareas sembradas: ');
			readln (hectareas);
			write ('Ingrese tipo de zona: ');
			readln (tipo);
			precio:=320;
			rendi (hectareas, tipo, precio, rendimiento);
			writeln ('El rendimiento es:', rendimiento:8:2);
			writeln ('=================================================');
			if (rendimiento>rendimax) then begin
				rendimax:=rendimiento;
				locamax:=localidad;
			end;
			if (rendimiento<rendimin) then begin
				rendimin:=rendimiento;
				locamin:=localidad;
			end;
			if (localidad='Tres de febrero') and (rendimiento>10000) then
				canttresf:=canttresf+1;
		until (localidad='Saladillo') and (hectareas=900);

		writeln ('La localidad con el campo de mayor rendimiento es:', locamax);
		writeln ('La localidad con el campo de menor rendimiento es:', locamin);
		writeln ('Cantidad de campos de Tres de Febrero con rendimiento superior a U$S 10.000:', canttresf);
	end.
