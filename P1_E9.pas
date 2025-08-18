program Prac1Ejer9;
//Suma o resta una serie de numeros ingresados por teclado
	var
		car:char; acumulado, numero:integer;
	begin
		write ('Ingrese "+" para sumar o "-" para restar: ');
		read (car);
		if (car='+') or (car='-') then begin
			write ('Ingrese num entero o "0" para terminar: ');
			read (numero);
			if (numero<>0) then
				acumulado:=numero;
			write ('Ingrese num entero o "0" para terminar: ');
			read (numero);
			while (numero<>0) do begin
				if (car='+') then
					acumulado:=acumulado+numero;
				if (car='-') then
					acumulado:=acumulado-numero;
				write ('Ingrese num entero o "0" para terminar: ');
				read (numero);
			end; {end del mientras}
			writeln('=============================================================================');
			writeln ('El resultado de aplicarle la operacion a los numeros ingresados es: ', acumulado);
			writeln('=============================================================================');
		end {end del if}
		else
			writeln ('Caracter ingresado no valido.');
	end.
