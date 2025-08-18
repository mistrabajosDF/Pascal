Program PracNumreal;
	//A partir de un numero real (primer read), pide ingresar otros hasta que
	//el valor de ese otro sea la mitad del primero
	var
		numreal, numleido: real;
	begin
		write ('Ingrese un numero real: ');
		read (numreal);
		write ('Ingrese un numero real: ');
		read (numleido);
		while (2*numleido<>numreal) do begin
			write ('Ingrese un numero real: ');
			read (numleido);
		end
end.
