Program P7E12;
//Se carga informacion de dispositivos ordenada por version android e informa:
//cantidad de dispositivos con cada versión de Android
//cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas
//tamaño promedio de las pantallas de todos los dispositivos
	type
		dispo=record
			version:string;
			pantalla:integer;
			ram:integer;
		end;	

		lista = ^nodo;

		nodo=record
			dato:dispo;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; d:dispo);
		var
			aux : lista;
		begin
			new(aux);
			aux^.dato:= d;
			aux^.sig:=nil;
			If (l=nil) then
				L:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;

	Procedure leerdispo (var d:dispo);
		begin
			write('Ingrese version Android: ');
			readln(d.version);
			if (d.version<>'0') then begin
				write('Ingrese tama?o de la pantalla: ');
				readln(d.pantalla);
				write('Ingrese ram: ');
				readln(d.ram);
			end;
			writeln ('===========================');
		end;

	Procedure cargarlista (var l, ult:lista);
		var
			d: dispo;
		begin
			leerdispo (d);
			while (d.version<>'0') do begin
				NodoOrd (l, ult, d);
				leerdispo (d);
			end;
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('Version android: ', p^.dato.version);
				writeln ('Tama?o pantalla: ', p^.dato.pantalla);
				writeln ('Ram: ', p^.dato.ram);
				writeln ('===========================');
				p:=p^.sig;
			end;
		end;

	Procedure ramypan (p:lista); //la cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas
		var
			cant:integer;
		begin
			cant:=0;
			while (p<> nil) do begin
				if (p^.dato.ram>3) and (p^.dato.pantalla<=5) then
					cant:=cant+1;
				p:=p^.sig;
				end;
			writeln ('Cantidad de dispositivos con mas de 3GB de ram y pantallas de a lo sumo a 5" es: ', cant);
		end;

	Procedure prompant (p:lista); //tamaño promedio de las pantallas
		var
			suma, veces:integer; prom:real;
		begin
			suma:=0;
			veces:=0;
			while (p<> nil) do begin
				suma:=suma+p^.dato.pantalla;
				veces:=veces+1;
				p:=p^.sig;
			end;
			prom:=suma/veces;
			writeln ('El tama?o promedio de las pantallas es: ', prom:8:2);
		end;

	Procedure cantversion(p:lista); //la cantidad de dispositivos para cada versión de Android
		var
			cant:integer; vact: string;
		begin
			while (p<> nil) do begin
				cant:=0;
				vact:=p^.dato.version;
				while (p<>nil) and (vact=p^.dato.version)do begin
					cant:=cant+1;
					p:=p^.sig;
				end;
				writeln ('La cantidad de dispositivos version ', vact, ' es: ', cant); 
			end;
		end;

	var
		l, ult:lista;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
		cantversion (l);
		ramypan (l);
		prompant (l);
	end.
