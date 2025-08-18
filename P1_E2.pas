Program Prac1Ejer2;
	
	//Dado un numero ingresado por teclado, calcula e imprime su valor absoluto
	var
		nreal:real;
	
	begin
		write ('Introduzca un numero real: ');
		read (nreal);
		if (nreal>=0) then
			write ('El valor absoluto del numero ingresado es: ', nreal:8:10)
		else
			write('El valor absoluto del numero ingresado es: ', nreal*-1:8:10)
	end.
