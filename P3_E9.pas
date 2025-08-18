Program ropa;
//Se ingresan 5 productos con su codigo y tipo por teclado. Luego se
//informa el codigo de pantalon mas caro y el del producto mas barato
	var
		precio, codigo, barato, codbarato, i, codpantcaro, preciopancaro:integer; 
		tipo:string; 
	begin
		barato:=10000;
		preciopancaro:=-10;
		for i:=1 to 6 do begin {Deberían ser 100}
			writeln('================================');
			write ('Ingrese precio del producto: ');
			readln (precio);
			write ('Ingrese codigo del producto: ');
			readln (codigo);
			write ('Ingrese tipo del producto: ');
			readln (tipo);
			if (precio<barato) then begin
				barato:=precio;
				codbarato:=codigo;
			end;
			if (tipo='pantalon') and (preciopancaro<precio) then begin
				codpantcaro:=codigo;
				preciopancaro:=precio;
			end;
		end;
		writeln('=============================================');
		writeln ('El codigo del producto mas barato es: ', codbarato);
		writeln ('El codigo del pantalon mas caro es: ', codpantcaro);
		writeln('=============================================');
	end.
