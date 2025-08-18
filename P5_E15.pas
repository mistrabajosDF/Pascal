program P5Ej15;
//Cargar informacion de proyectos y participantes. La carga finaliza con 
//el codigo de proyecto -1. Luego informa: 
//Monto total invertido en desarrolladores argentinos
//hs trabajadas por Administradores de bases de datos
//código del proyecto con mayor monto invertido
//cantidad de Arquitectos de software de cada proyecto.
	const
		tam=5; //deberia ser 1000
	type
		info=record
			pais:string;
			codigo:integer;
			nombre:string;
			rol:integer;
			horas:integer;
		end;

		proyectos=array[1..tam] of real;
		roles=array[1..5] of real;

	procedure leer(var s:info);
		begin
			write('Pais: ');
			readln(s.pais);
			write('Codigo: ');
			readln(s.codigo);
			write('Nombre: ');
			readln(s.nombre);
			write('Rol: ');
			readln(s.rol);
			write('Horas: ');
			readln(s.horas);
			writeln('=================');
		end;

	procedure inicializaren0(var a:proyectos);
		var
			i:integer;
		begin
			for i:=1 to tam do
				a[i]:=0;
		end;
		
	procedure inicializartablita(var a:roles);
		begin
			a[1]:=35.20;
			a[2]:=27.45;
			a[3]:=31.03;
			a[4]:=44.28;
			a[5]:=39.87;
		end;

	function codigomayormonto(mayormonto:proyectos):integer;
		var
			max:real; i:integer; item:integer;
		begin
			max:=1;
			for i:=1 to tam do begin
				if mayormonto[i]>max then begin
					max:=mayormonto[i];
					item:=i;
				end;
			end;
			codigomayormonto:=item;
		end;

	procedure imprcantarqui(c_arqui:proyectos);
		var
			i:integer;
		begin
			writeln('Cantidad de Arquitectos de software en cada proyecto:');
			writeln();
			for i:=1 to tam do begin
				writeln(i,': ',c_arqui[i]:8:2,' ');
			end;
			writeln('=================');
		end;

	procedure invertidoen(s:info;calcular:roles;var montoarg:real);
		begin
			if(s.pais='Argentina') then
				montoarg:=montoarg+calcular[s.rol]*s.horas;
		end;

	procedure canthoras(s:info;var contador:integer);
		begin
			if(s.rol=3) then
				contador:=contador+s.horas;
		end;

	procedure sumamontoxp(s:info; calculomonto:real; calcular:roles; var montos:proyectos);
		begin
			calculomonto:=calcular[s.rol]*s.horas;
			montos[s.codigo]:=montos[s.codigo]+calculomonto;
		end;

	procedure cantarquixp(s:info;var c_arqui:proyectos);
		begin
			if(s.rol=4) then
				c_arqui[s.codigo]:=c_arqui[s.codigo]+1;
		end;

	var
		s:info;	calcular:roles; contador:integer;
		montos,c_arqui:proyectos; calculomonto,montoarg:real;
	begin
		leer(s);
		contador:=0;
		montoarg:=0;
		inicializartablita(calcular);
		inicializaren0(montos);
		inicializaren0(c_arqui);
		while(s.codigo<>-1) do begin
			invertidoen(s,calcular,montoarg);
			canthoras(s,contador);
			sumamontoxp(s,calculomonto,calcular,montos);
			cantarquixp(s,c_arqui);
			leer(s);
		end;
		writeln(montoarg:8:2,' es el monto total invertido en desarrolladores con residencia en Argentina');
		writeln(contador,' es la cantidad total de horas trabajadas por administradores de bases de datos');
		writeln(codigomayormonto(montos),' es el codigo del proyecto con mayor monto invertido');
		imprcantarqui(c_arqui);
	end.
