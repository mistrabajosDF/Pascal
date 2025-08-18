Program PracNumreal;
//Dado un numero ingresado por teclado, se pide ingresar numeros 
//hasta ingresar el doble del primero, o bien, haberlo hecho 10 veces
	var
		numreal, numleido: real; veces:integer;
	begin
		write ('Ingrese un numero real: ');
		read (numreal);
		write ('Ingrese un numero: ');
		read (numleido);
		veces:=1;
		while (numleido/2<>numreal) and (veces<10) do begin
			write ('Ingrese un numero: ');
			read (numleido);
			veces:=veces+1;
			If (veces=10) then
				write ('No se ha ingresado el doble de ', numreal:8:2);
		end;
	end.
