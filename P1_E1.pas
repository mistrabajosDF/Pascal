Program Practica1e2;

//Dados dos numeros enteros ingresados por teclado, imprime cual es el mayor o si ambos son iguales

	var
		primernum, segnum:integer;
	begin
		write ('Ingrese primer numero:');
		read (Primernum);
		write ('Ingrese segundo numero:');
		read (segnum);

		if (primernum>segnum)then
			write('El primer numero es mayor.')
		else
			if (segnum>primernum)then
				write ('El segundo numero es mayor.')
			else
				if (primernum=segnum)then 
				//Este if es redundante, puede eliminarse
					write ('Los numeros leidos son iguales');
	end.



