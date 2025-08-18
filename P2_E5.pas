Program Prac2Ejer4;
//Dados numeros ingresaos por teclado, informa el mayor, el menor
//y la suma de estos. Se termina al ingresar el 100
	var
		num, min, suma, max:integer;
	begin
		min:=10000;
		max:=0;
		suma:=0;
		repeat
			write ('Ingrese numero: ');
			read (num);
			suma:=suma+num;
			if (num<min) then
				min:=num;
			if (num>max) then
				max:=num;
		until (num=100);
		writeln ('El numero menor es: ', min);
		writeln ('El numero mayor es: ', max);
		writeln ('La suma de los numeros es: ', suma);
	end.
