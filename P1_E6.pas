Program Prac1Ejer6;
//Recibe por teclado numeros de alumnos y sus promedios y calcula cuantos
//son destacados, promedios superiores a 6 y total ingresado. Para finalizar
//se ingresael numero de alumno -1
	var
		legajo, cantalum, buenprom, destacado:integer;
		promedio: real;
	begin
		cantalum:=0;
		buenprom:=0;
		destacado:=0;
		write ('Ingrese num de legajo:' );
		read (legajo);
		while (legajo<>-1) do begin
			write ('Ingrese promedio:' );
			read (promedio);
			cantalum:=cantalum+1;
			If (promedio>6.5)then
				buenprom:=buenprom+1;
			If (promedio>8.5) and (legajo<2500)then
				destacado:=destacado+1;
			writeln ('================================');
			write ('Ingrese num de legajo:' );
			read (legajo);
		end;
		writeln ('================================');
		writeln ('Cantidad de alumnos ingresada: ', cantalum);
		writeln ('Cantidad de alumnos con promedios superiores a 6.5: ', buenprom);
		writeln ('Cantidad de alumnos destacados: ', destacado);
		writeln ('================================');
	end.
