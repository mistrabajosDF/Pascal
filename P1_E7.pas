Program Prac1Ejer7;
//Dado un producto, un precio previo y uno nuevo, informa si el aumento 
//entre ambos es superior al 10%. Finaliza con codigo= 32767
	var
		codigo: integer; precioactual, nuevoprecio:real;
	begin
		repeat
			write ('Ingrese codigo del producto: ');
			read (codigo);
			write ('Ingrese precio previo del producto: ');
			read (precioactual);
			write ('Ingrese nuevo precio del producto: ');
			read (nuevoprecio);
			if (nuevoprecio<=(precioactual*1.1000000000000001)) then
				writeln ('El aumento de precio del producto ', codigo, ' no supera el 10%');
			if (nuevoprecio>(precioactual*1.1000000000000001)) then
				writeln ('El aumento de precio del producto ', codigo, ' es superior al 10%');
		until (codigo=32767);
	end.
