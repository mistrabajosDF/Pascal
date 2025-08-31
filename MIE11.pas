{Un cine posee la lista de películas, con código de película, código de género (1: acción, 2: aventura, 3: drama,
4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje.
a. Módulo que lea los datos de películas y los almacene ordenados por código de
película y agrupados por código de género, en una estructura de datos adecuada. La
lectura finaliza cuando se lee el código de película -1.
b. Un módulo que reciba la estructura generada y retorne una estructura
de datos donde estén todas las películas almacenadas ordenadas por código de película.}

Program e11;
	type
	peli=record
		codp:integer;
		codg:integer;
		punt:real;
	end;

	lista=^nodo;

	nodo=record
		dato:peli;
		sig:lista;
	end;

	vpelis=array [1..8] of lista;
	vpunt=array [1..8] of lista;

procedure leerpeli (var p:peli);
	begin
		writeln('Ingrese codigo de pelicula: ');
		readln(p.codp);
		if(p.codp<>-1)then begin
			writeln('Ingrese codigo de genero: ');
			readln(p.codg);
			writeln('Ingrese puntaje promedio: ');
			readln(p.punt);
		end;
end;

procedure inicializar (var v:vpelis);
	var
		i:integer;
	begin
		for i:=1 to 8 do
			v[i]:=nil;
end;

procedure insertar (var l:lista; p:peli);
	var
		nue,ant,act:lista;
	begin
		new (nue);
		nue^.dato:=p;
		act:=l;
		ant:=l;
		while (act <> nil) and (p.codp > act^.dato.codp) do begin
			ant:=act;
			act:= act^.sig;
		end;
		if (act=ant) then 
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
end;

procedure cargarlista (var v:vpelis);
	var
		p:peli;
	begin
		inicializar(v);
		leerpeli(p);
		while (p.codp<>-1)do begin
			insertar(v[p.codg],p);
			leerpeli(p);
		end;
end;

procedure agregar_atras (var Ln,ult:lista; min:peli);
	var
	  nue:lista;
	begin
		new(nue);
		nue^.dato:= min;
		nue^.sig := nil;
		if(Ln = nil)then
		  Ln := nue
		else
		  ult^.sig:=nue;
		ult:=nue;
end;

procedure minimo_merge (var v:vpelis; var minPel:peli; var min:integer);
	var
		indiceMin, i: integer;
	begin 
		min := 999;
		indiceMin := -1;
		for i := 1 to 8 do begin
			if (v[i] <> nil) then
			if (v[i]^.dato.codp < min) then begin
				indiceMin := i;
				min := v[i]^.dato.codp;
			end
		end;
		if (indiceMin <> -1) then begin
			minPel.codp := v[indiceMin]^.dato.codp;
			minPel.codg := v[indiceMin]^.dato.codg;
			minPel.punt := v[indiceMin]^.dato.punt;
			v[indiceMin] := v[indiceMin]^.sig;
		end;
	end;

procedure merge (v:vpelis; var l:lista);
	var
		ult: lista; minPel: peli; min:integer;
	begin
		l:= nil; 
		ult:= nil;
		minimo_merge (v, minPel, min);
		while (min <> 999) do begin
			agregar_atras (l, ult, minPel);
			minimo_merge (v, minPel, min);
		end;
end;

procedure imprimir (l:lista);
	begin
		if (l <> nil) then begin
			write ('El codigo de la pelicula es: ',l^.dato.codp);
			writeln ('');
			l:= l^.sig;
			imprimir (l);
		end;
end;

var 
	v:vpelis; l:lista;
begin
	cargarlista (v);
	writeln ('');
	merge (v, l);
	writeln('Peliculas ordenadas por código: ');
	imprimir(l);
	writeln ('');
end.
