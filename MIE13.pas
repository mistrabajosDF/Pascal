{Un teatro tiene funciones todos los días. Para cada día se tiene una lista con las
entradas vendidas.
a. Genere 7 listas con las entradas vendidas para cada día. De cada una se lee día (de
1 a 7), código de la obra, asiento y monto. Finaliza con el código de obra igual a
0. Las listas deben estar ordenadas por código de obra de forma ascendente.}

Program e13;
	type
	entradas=record
		dia:integer;
		cod:integer;
		asiento:integer;
		monto:real;
	end;

	lista=^nodo;
	nodo=record
		dato:entradas;
		sig:lista;
	end;

	ventradas=array [1..7] of lista;

procedure leerentrada (var e:entradas);
	begin
		writeln('Ingrese codigo de obra: ');
		readln(e.cod);
		if(e.cod<>0)then begin
			writeln('Ingrese dia de la semana (1 a 7): ');
			readln(e.dia);
			writeln('Ingrese asiento: ');
			readln(e.asiento);
			writeln('Ingrese monto: ');
			readln(e.monto);
		end;
end;

procedure inicializar (var v:ventradas);
	var
		i:integer;
	begin
		for i:=1 to 7 do
			v[i]:=nil;
	end;

procedure insertar (var l:lista; e:entradas);
	var
		nue,ant,act:lista;
	begin
		new (nue);
		nue^.dato:=e;
		act:=l;
		ant:=l;
		while (act <> nil) and (e.cod > act^.dato.cod) do begin
			ant:=act;
			act:= act^.sig;
		end;
		if (act=ant) then 
			l:=nue
		else
			ant^.sig:=nue;
		nue^.sig:=act;
end;

procedure cargarlista (var v:ventradas);
	var
		e:entradas;
	begin
		inicializar(v);
		leerentrada(e);
		while (e.cod<>0)do begin
			insertar(v[e.dia],e);
			leerentrada(e);
		end;
end;

procedure imprimir (v:ventradas);
	var
		i:integer;
	begin
		for i:=1 to 7 do begin
			while (v[i]<>nil) do begin
				writeln ('Dia: ', v[i]^.dato.dia);
				writeln ('Codigo: ', v[i]^.dato.cod);
				writeln ('Asiento: ', v[i]^.dato.asiento);
				writeln ('Monto: ', v[i]^.dato.monto:5:2);
				v[i]:=v[i]^.sig;
			end;	
		end;
end;

var 
	v:ventradas;
begin
	cargarlista (v);
	imprimir (v);
end.
