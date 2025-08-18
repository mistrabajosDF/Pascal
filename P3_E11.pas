Program P3E11;
//A partir de numeros ingresados por teclado, informa los resultados de la suma
//y la multiplicacion de digitos pares e impares. Termina al ingresar 12345
	var
		numero, numeroa, sumapar, sumaimpar, multipar, multiimpar, digito:integer;
		noCambioImpar, noCambioPar: boolean;
	begin
		write ('Ingrese numero: ');
		read (numero);
		numeroa:=numero;
		while (numeroa<>12345) do begin
			sumaimpar:=0;
			sumapar:=0;
			multipar:=0;
			multiimpar:=0;
			noCambioPar:=true;
			noCambioImpar:=true;
			while (numero<>0) do begin
				if (numero mod 2=1) then begin
					if (multiimpar=0) and (noCambioImpar=true) then
						multiimpar:=1;
					digito:=numero mod 10;
					sumaimpar:=sumaimpar+digito;
					multiimpar:=multiimpar*digito;
					numero:=numero div 10;
				end;
				if (numero mod 2=0) and (numero<>0) then begin
					if (multipar=0) and (noCambioPar=true) then
						multipar:=1;
					digito:=numero mod 10;
					if digito=0 then begin
						multipar:=0;
						noCambioPar:=false;
					end;
					sumapar:=sumapar+digito;
					multipar:=multipar*digito;
					numero:=numero div 10;
				end;
				
			end;

			writeln ('---------------------');
			writeln ('La suma de los digitos impares es: ', sumaimpar);
			writeln ('La multiplicacion de los digitos impares es: ', multiimpar);
			writeln ('La suma de los digitos pares es: ', sumapar);
			writeln ('La multiplicacion de los digitos pares es: ', multipar);
			writeln ('==============================================');
			write ('Ingrese numero: ');
			read (numero);
			noCambioPar:=true;
			noCambioImpar:=true;
			numeroa:=numero;
		end;
	end.
