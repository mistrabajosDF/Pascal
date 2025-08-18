Program P0E3;

//Dados dos numeros ingresados por teclado, divide el primero por el segundo e imprime el resultado

	var
		num1, num2, num3:real;
		
	begin
		writeln ('Ingrese primer numero: ');
		read (num1);
		writeln ('Ingrese segundo numero: ');
		read (num2);
		num3:=num1/num2;
		write ('La division entre ambos numeros da:', num3:8:2);
	end.
