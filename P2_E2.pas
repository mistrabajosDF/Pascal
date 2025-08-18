Program Prac2Ejer2;
//Lee 10 numeros por teclado, informa cual es el mayor y en que posicion
//(Orden) se ingresó dicho numero
	var
		i, numero, numeromayor, posicion:integer;
	begin
		i:=1;
		numeromayor:=-32767;
		for i:=1 to 10 do begin
			write ('Ingrese numero: ');
			read (numero);
			if (numeromayor<numero) then begin;
				numeromayor:=numero;
				posicion:=i;
			end;
		end;
		write ('El mayor numero leido fue el ', numeromayor, ' en la posicion ', posicion);
	end.
