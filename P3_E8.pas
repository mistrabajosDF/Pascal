Program p3e8;
//A partir de ingreso de pares de numeros, informa cuantos de esos pares
//cumplen que primerNumero*2= segundoNumero
//El ingreso finaliza con 0
	Function doble(numa, numb:integer):boolean;
		begin
			doble:=(numb=2*numa);
	end;

	var
		numa, numb, cantpares, cantdobles:integer;
	
	begin
		cantpares:=0;
		cantdobles:=0;
		write ('Ingrese primer numero: ');
		read (numa);
		write ('Ingrese segundo numero: ');
		read (numb);

		while (numa<>0) and (numb<>0) do begin
			cantpares:=cantpares+1;
			if (doble(numa, numb)) then
				cantdobles:=cantdobles+1;
			writeln('========================');
			write ('Ingrese primer numero: ');
			read (numa);
			write ('Ingrese segundo numero: ');
			read (numb);
		end;
		writeln('=====================================================');
		writeln ('La cantidad de pares de numeros ingresados fue: ', cantpares);
		writeln ('La cantidad de pares de numeros con su doble fue: ', cantdobles);
		writeln('=====================================================');
	end.
