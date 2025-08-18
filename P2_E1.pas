Program P2E1;
//A partir de 10 numeros ingresados, realiza la suma entre estos e
//informa cuantos son mayores a 5
	var
		i, suma, numero, cinco:integer;
	begin
		suma:=0;
		i:=1;
		cinco:=0;
		for i:= 1 to 10 do begin
			write ('Escriba un numero: ');
			read (numero);
			suma:=suma+numero;
			if (numero>5) then
				cinco:=cinco+1;
		end;
		writeln ('El resultado de la suma de los numeros ingresados es:', suma);
		write ('Cantidad de numeros ingresados mayores a 5: ', cinco);
	end.
