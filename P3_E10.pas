Program p3e10;
//Se ingresan numeros por teclado y, para cada uno, se informa la cantidad
//de digitos y la suma de estos. Se termina cuando dicha suma da 10
	Procedure numero (nume:integer; var digitos, suma:integer);
		var
			digito:integer;
		begin
			while (nume<>0) do begin
				digito:=nume mod 10;
				suma:=suma+digito;
				nume:=nume div 10;
				digitos:=digitos+1;
			end;
		end;
		
	var
		nume, digitos, suma, numleidos:integer;
	
	begin
		nume:=0;
		numleidos:=0;
		repeat 
			write ('Escriba numero entero: ');
			read(nume);
			digitos:=0; {si no esta no pasa nah}
			suma:=0; {si no esta no pasa nah}
			numero (nume, digitos, suma);
			writeln ('La cantidad de digitos del numero es: ', digitos);
			writeln ('La suma de todos los digitos da: ', suma);
			numleidos:=numleidos+1;
			writeln('==========================================');
		until (suma=10);
		write ('El total de digitos leidos es: ', numleidos);
	end.
