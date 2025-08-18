Program PracunoEjerocho;
//Dados 3 caracteres ingresados por teclado, informa si son volcales
//sin tilde o no
	var
		caruno, cardos, cartres: char; vocales:integer;
	begin
		vocales:=0;
		write ('Ingrese caracter en minuscula: ');
		readln (caruno);
		write ('Ingrese caracter en minuscula: ');
		readln (cardos);
		write ('Ingrese caracter en minuscula: ');
		readln (cartres);

		if (caruno= 'a') or (caruno='e') or (caruno='i') or (caruno='o') or (caruno='u') then
			vocales:=vocales+1;
		if (cardos= 'a') or (cardos='e') or (cardos='i') or (cardos='o') or (cardos='u') then
			vocales:=vocales+1;
		if (cartres= 'a') or (cartres='e') or (cartres='i') or (cartres='o') or (cartres='u') then
			vocales:=vocales+1;
		if (vocales=3) then
			write ('Los 3 caracteres son vocales sin tildes.')
		else
			write ('Al menos uno de los caracteres no era una vocal sin tilde.');
	end.
