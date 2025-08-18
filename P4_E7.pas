Program mau;
//Los centros de las mismas universidades deben ingresarse consecutivamente
//Informa la cantidad de centros por universidad, las universiddes con 
//mas investigadores y los dos con mas becarios
	type
		centro= record
			nombre: string;
			uni: string;
			invest: integer;
			beca: integer;
		end;

	Procedure leer (var c:centro);
		begin
			write ('Ingrese nombre del Centro: ');
			readln (c.nombre);
			write ('Ingrese universidad: ');
			readln (c.uni);
			write ('Ingrese cantidad de investigadores: ');
			readln (c.invest);
			write ('Ingrese cantidad de becarios: ');
			readln (c.beca);
			writeln('======================================');
		end;

	var
		c:centro; uniactual, unimasinves, unimasbeca, unimasbecados:string; 
		cantcxu, cantinv, cantbeca, masinv, masbeca, masbecados:integer;

	begin
		leer (c);
		masinv:=0; {cantidad mayor de investigadores}
		masbeca:=0; {cantidad mayor de becarios}
		masbecados:=0; {cantidad 2º mayor de becarios}

		while (c.invest<>0) do begin
			uniactual:=c.uni;
			cantcxu:=0;{cantidad de centros por uni}
			cantinv:=0;{cantidad de investigadores de la uni}
			cantbeca:=0; {cantidad de becarios de la uni}

			while (c.uni=uniactual) and (c.invest<>0) do begin
				cantcxu:=cantcxu+1; {cantidad de centros por uni}
				cantbeca:=cantbeca+c.beca; {cantidad de becarios de la uni}
				cantinv:=cantinv+c.invest; {cantidad de investigadores de la uni}

				if (masinv<cantinv) then begin {universidad con mayor cantidad de investigadores}
					masinv:=cantinv;
					unimasinves:=c.uni;
				end;

				if (masbeca<cantbeca) then begin {2 universidades con mas becados}
					unimasbecados:=unimasbeca;
					unimasbeca:=c.uni;
					masbecados:=masbeca;
					masbeca:=cantbeca;
				end
				else
					if (cantbeca>masbecados) then begin {2 universidades con mas becados}
						unimasbecados:=c.uni;
						masbecados:=cantbeca;
					end;
				leer (c);
			end; {end del segundo mientras}

			writeln ('La cantidad de Centros de ', uniactual, ' es: ', cantcxu);
		end; {end del primer mientras}
		writeln ('La universidad con mas investigadores es: ', unimasinves);
		writeln ('La universidad con mas becarios es: ', unimasbeca, ' y la segunda: ', unimasbecados);
	end.
