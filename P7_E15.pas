Program p7e15;
//se cargan datos de corredores y se informa:
//cantidad de estos y distancia y tiempo total de todos los corredores
//ciudad que convocó mas corredores y total de km recorridos en esta
//distancia promedio de corredores de Brasil.
//cantidad de corredores que partieron de una ciudad y finalizaron en otra
//El paso (cantidad de minutos por km) promedio de los corredores de Boston
	type
		corredor=record
			nombre, apellido:string;
			distancia, tiempo:integer;
			pais, ciudado, ciudadd:string; //ciudad origen y destino
		end;

		lista = ^nodo;

		nodo=record
			dato:corredor;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; c:corredor);
		var
			aux : lista;
		begin
			new(aux);
			aux^.dato:= c;
			aux^.sig:=nil;
			If (l=nil) then
				L:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;

	Procedure leercorredor (var c:corredor);
		begin
			write('Ingrese nombre: ');
			readln(c.nombre);
			if (c.nombre<>'ZZZ') then begin
				write('Ingrese apellido: ');
				readln(c.apellido);
				write('Ingrese distancia en km: ');
				readln(c.distancia);
				write('Ingrese tiempo: ');
				readln(c.tiempo);
				write('Ingrese pais de origen: ');
				readln(c.pais);
				write('Ingrese ciudad de origen: ');
				readln(c.ciudado);
				write('Ingrese ciudad de destino: ');
				readln(c.ciudadd);
				writeln('===========================');
			end;
		end;

	Procedure cargarlista (var l, ult:lista);
		var
			c: corredor;
		begin
			leercorredor (c);
			while (c.nombre<>'ZZZ') do begin
				NodoOrd (l, ult, c);
				leercorredor (c);
			end;
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln('Apellido: ', p^.dato.apellido);
				writeln('Distancia en km: ', p^.dato.distancia);
				writeln('Tiempo: ', p^.dato.tiempo);
				writeln('Pais de origen: ', p^.dato.pais);
				writeln('Ciudad de origen: ', p^.dato.ciudado);
				writeln('Ciudad de destino: ', p^.dato.ciudadd);
				p:=p^.sig;
				writeln('=================================');
			end;
		end;

	Procedure promedioB (p:lista); //distancia promedio recorrida por corredores de Brasil.
		var
			disbra, cant:integer; prom:real;
		begin
			disbra:=0;
			cant:=0;
			while (p<> nil) do begin
				if (p^.dato.pais='Brasil') then begin
					disbra:=disbra+p^.dato.distancia;
					cant:=cant+1;
				end;
				p:=p^.sig;
			end;
			prom:=disbra/cant;
			writeln ('La distancia promedio recorrida por corredores de brasil es: ', prom:8:2);
		end;

	Procedure distciudad (p:lista); //cantidad de corredores que partieron de una ciudad y finalizaron en otra
		var
			cant:integer;
		begin
			cant:=0;
			while (p<> nil) do begin
				if (p^.dato.ciudado<>p^.dato.ciudadd) then
					cant:=cant+1;
				p:=p^.sig;
			end;
			writeln ('La cant de corredores que partieron de una ciudad y finalizaron en otra es: ', cant);
		end;

	Procedure cantidades (p:lista); //cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos los corredores.
		var
			cantc, cantd, cantt:integer;
		begin
			cantc:=0;
			cantd:=0;
			cantt:=0;
			while (p<> nil) do begin
				cantc:=cantc+1;
				cantd:=cantd+p^.dato.distancia;
				cantt:=cantt+p^.dato.tiempo;
				p:=p^.sig;
			end;
			writeln ('La cant de corredores es: ', cantc);
			writeln ('La distancia total es: ', cantd);
			writeln ('El tiempo total es: ', cantt);
			end;

	Procedure boston (p:lista); //Paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.
		var
			km, min:integer; paso:real;
		begin
			km:=0;
			min:=0;
			while (p<> nil) do begin
				if (p^.dato.ciudado='Boston') then begin
					km:=km+p^.dato.distancia;
					min:=min+p^.dato.tiempo;
				end;
				p:=p^.sig;
			end;
			paso:=min/km;
			writeln ('El paso promedio de los corredores de la ciudad de Boston es: ', paso:8:2);
		end;

	Procedure ciudadmax(p:lista); //ciudad que convocó mas corredores y el total de km recorridos por los corredores de esa ciudad.
		var
			ciuact, ciumax:string; corAct, corAcum, kmact, kmmax:integer; 
		begin
			coracum:=0;
			while (p<> nil) do begin
				corAct:=0;
				kmact:=0;
				ciuact:=p^.dato.ciudado;
				while (p<>nil) and (ciuact=p^.dato.ciudado)do begin
					corAct:=corAct+1;
					kmact:=kmact+p^.dato.distancia;
					p:=p^.sig;
				end;
				if (corAct>corAcum) then begin
					ciumax:=ciuact;
					corAcum:=corAct; 
					kmmax:=kmact;
				end;
				writeln ('La ciudad con mas corredores es ', ciumax, ' que han recorrido: ', kmmax, ' km.');
			end;
		end;

	var
		l, ult:lista;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
		promedioB (l);
		distciudad (l);
		cantidades (l);
		ciudadmax (l);
		boston (l);
	end.
