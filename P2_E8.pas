Program Practica2Ej8;
//Calcula para 31 días, el total de ventas por dia y el total 
//de ventas del mes a partir de informacion ingresada por teclado.
//Se corta el ingreso con el monto "0"
	var
		i, monto, montomes, montodia:integer;
	begin
		i:=1;
		montodia:=0;
		montomes:=0;
		for i:=1 to 31 do begin
			writeln('=============================================');
			write ('Ingrese monto: ');
			read (monto);
			while (monto<>0) do begin
				montodia:=montodia+monto;
				write ('Ingrese monto: ');
				read (monto);
			end;
			montomes:=montomes+montodia;
			writeln('=============================================');
			writeln ('El total de ventas del dia ', i, ' es: ', montodia);
			montodia:=0;
		end;
		writeln('=============================================');
		writeln ('La suma del total del mes es: ', montomes);
		writeln('=============================================');
	end.
