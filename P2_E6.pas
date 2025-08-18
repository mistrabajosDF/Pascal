Program Practica2Ej6;
//Se ingresan 5 productos por teclado y se informan los dos 
//mas baratos y la cantidad con codigo par y precio mayor a 16
	var
		i, codigo, codpar, codigomb, codigob, precio, masbarato, barato:integer;
	begin
		i:=1;
		codpar:=0;
		masbarato:=10000;
		codigomb:=0;
		barato:=1000;
		codigob:=1;
		for i:=1 to 5 do begin {en realidad son 200 productos}
			writeln('====================================');
			write ('Escriba codigo del producto:' );
			read (codigo);
			write ('Escriba precio del producto:' );
			read (precio);
			if ((codigo MOD 2)=0) and (precio>16) then
				codpar:=codpar+1;
			if (precio<masbarato) then begin
				barato:=masbarato;
				codigob:=codigomb;
				masbarato:=precio;
				codigomb:=codigo;
			end
			else
				if(precio<barato)then begin
					barato:=precio;
					codigob:=codigo;
				end
		end;
		writeln('===========================================================================');
		writeln ('Los productos mas baratos son: ', codigomb, ' y ', codigob);
		writeln ('La cantidad de productos con codigo par y precio superior a 16 es:', codpar);
		writeln('===========================================================================');
	end.
