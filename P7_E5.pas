Program p7e5;
//Se almacena informacion de sondas y se informa:
//nombre de la mas costosa, cantidad de sondas que realizarán estudios ​en 
//cada rango​ del espectro electromagnético. cantidad de sondas cuya duracion
//estimada supera la duración promedio de todas las sondas
//nombre de las sondas cuyo costo de construcción supera el costo promedio 

//DIFERENCIA: PROCESO ESPECTRO
	type
		sonda=record
			nombre:string;
			duracion, cconst, cmant:real;
			rango:integer;
		end;

		vcont=array [1..7] of integer;

		lista=^nodo;

		nodo=record
			dato:sonda;
			sig:lista;
		end;

	Procedure agregar (var l:lista; s:sonda); //carga
		var
			nue:lista;
		begin
			new (nue);
			nue^.dato:=s;
			nue^.sig:=l;
			l:=nue;
		end;

	Procedure cargars (var s:sonda); //carga
		begin
			with s do begin
				write ('Ingrese nombre: ');
				readln (nombre);
				write ('Ingrese duracion de la mision en meses: ');
				readln (duracion);
				write ('Ingrese costo de construccion: ');
				readln (cconst);
				write ('Ingrese costo de mantenimiento: ');
				readln (cmant);
				write ('Ingrese rango de espectro (1 a 7): ');
				readln (rango);
				writeln ('==========================================');
			end;
		end;

	Procedure cargarl (var l:lista); //carga
		var
			s:sonda;
		begin
			cargars (s);
			repeat
				agregar (l, s);
				cargars (s);
			until (s.nombre='GAIA')
		end;

	Procedure mascara (l:lista); //nombre de la sonda más costosa (considerando construcción y mantenimiento)
		var
			max:real; nombre:string;
		begin
			max:=-1;
			while (l<> nil) do begin
				If ((l^.dato.cconst+l^.dato.cmant)>max) then begin
					max:=(l^.dato.cconst+l^.dato.cmant);
					nombre:=l^.dato.nombre;
				end;
				l:=l^.sig;
			end;
			writeln ('La sonda mas cara es: ', nombre);
			writeln ('==========================================');
		end;

	Procedure espectro (l:lista); //cant de sondas que realizarán estudios ​en cada rango​ del espectro
		var
			vc:vcont; i:integer;
		begin
			for i:=1 to 7 do 
				vc[i]:=0;
			while (l<> nil) do begin
				vc[l^.dato.rango]:=vc[l^.dato.rango]+1;
				l:=l^.sig;
			end;
			for i:=1 to 7 do 
				writeln ('La cantidad de sondas del espectro ', i, ' es: ', vc[i]);
			writeln ('==========================================');
		end;

	Procedure calcpromedio1 (l:lista; var promedio1:real); //cant de sondas cuya duración supera la duración promedio de todas las sondas
		var
			suma:real; veces:integer;
		begin
			suma:=0;
			veces:=0;
			while (l<> nil) do begin
				suma:=suma+l^.dato.duracion;
				l:=l^.sig;
				veces:=veces+1;
			end;
			promedio1:=suma/veces;
			writeln ('El promedio de duracion es ', promedio1:8:2);
			writeln ('==========================================');
		end;

	Procedure cantsondas (l:lista; promedio1:real); //cant de sondas cuya duración supera la duración promedio de todas las sondas
		var
			cant:integer;
		begin
			cant:=0;
			while (l<> nil) do begin
				if ((l^.dato.duracion)>promedio1) then begin
					cant:=cant+1;
				end;
				l:=l^.sig;
			end;
			writeln ('La cantidad de sondas cuya duracion supera el promedio total es: ', cant);
			writeln ('==========================================');
		end;

	Procedure calcpromedio2 (l:lista; var promedio2:real); //nombre de sondas c/costo de constr que supera el costo promedio entre todas
		var
			suma:real; veces:integer;
		begin
			suma:=0;
			veces:=0;
			while (l<>nil) do begin
				suma:=suma+l^.dato.cconst;
				l:=l^.sig;
				veces:=veces+1;
			end;
			promedio2:=suma/veces;
			writeln ('El promedio de costo es: ', promedio2:8:2);
			writeln ('==========================================');
		end;

	Procedure calcPC (l:lista; var promedio2:real); //nombre de sondas c/costo de constr que supera el costo promedio entre todas
		begin
			while (l<>nil) do begin
				if (l^.dato.cconst>promedio2) then
					writeln ('Sonda cuyo costo de construccion supera al promedio: ', l^.dato.nombre);
				l:=l^.sig;
			end;
			writeln ('==========================================');
		end;

	var
		l:lista; promedio2, promedio1:real;
	begin
		l:=nil;
		cargarl (l);
		mascara (l);
		espectro (l);
		calcpromedio1 (l, promedio1);
		cantsondas (l, promedio1);
		calcpromedio2 (l, promedio2);
		calcPC (l, promedio2);
	end.
