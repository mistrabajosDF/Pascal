Program P7E6;
//Un modulo recibe info de una sonda y devuelve si cumple con:
//Costo de mantenimiento <costo de construcción y /no analice ondas de radio
//Otro modulo procesa la lista y genera dos listas: proyectos que cumplen 
//y proyectos que no.
//Otro modulo que reciba proyectos de sondas espaciales e informe cantidad
//y costo de proyectos no financiados


	type
		sonda=record
			nombre:string;
			duracion:real;
			cconst:real;
			cmant:real;
			rango:integer;
		end;

		lista=^nodo;

		nodo=record
			dato:sonda;
			sig:lista;
		end;

	Procedure agregar (var l:lista; s:sonda); //carga lista
		var
			nue:lista;
		begin
			new (nue);
			nue^.dato:=s;
			nue^.sig:=l;
			l:=nue;
		end;

	Procedure cargars (var s:sonda); //carga lista principal
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
				writeln('==========================================');
			end;
		end;

	Procedure cargarl (var l:lista); //carga lista principal
		var
			s:sonda;
		begin
			cargars (s);
			repeat
				agregar (l, s);
				cargars (s);
			until (s.nombre='GAIA')
		end;

	Procedure cargarlc1 (p:lista; var s:sonda); //carga sublistas
		begin
			with s do begin
				nombre:=p^.dato.nombre;
				duracion:=p^.dato.duracion;
				cconst:=p^.dato.cconst;
				cmant:=p^.dato.cmant;
				rango:=p^.dato.rango;
			end;
		end;

	Procedure cargarlc (l:lista; var lc:lista); //carga sublistas
		var
			s:sonda;
		begin
			cargarlc1 (l, s);
			agregar (lc, s);
		end;

	Function cumple (l:lista):boolean;
		begin
			cumple:=((l^.dato.cconst>l^.dato.cmant) and (l^.dato.rango<>1)); 
			//el costo de mantenim sea menor que el de construccion y que no analice ondas de radio
		end;

	Procedure recorra (l:lista; var lc:lista; var lnc:lista); 
		begin
			while (l<> nil) do begin
				if cumple (l) then begin
					writeln ('La sonda ', l^.dato.nombre, ' cumple');
					writeln('==========================================');
					cargarlc (l, lc);
				end//if
				else
					cargarlc (l, lnc);
				l:=l^.sig;
			end;
		end;

	Procedure imprimir (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('Nombre: ', p^.dato.nombre);
				writeln ('Duracion: ', p^.dato.duracion:8:2);
				writeln ('Costo de construccion: ', p^.dato.cconst:8:2);
				writeln ('Costo de mantenimiento: ', p^.dato.cmant:8:2);
				writeln ('Rango: ', p^.dato.rango);
				writeln('==========================================');
				p:=p^.sig;
			end;
		end;

	var
		l, lc, lnc:lista;
	begin
		l:=nil;
		lc:=nil;
		lnc:=nil;
		cargarl (l);
		writeln ('Lista completa: ');
		writeln('==========================================');
		imprimir (l);
		recorra (l, lc, lnc);
		writeln ('Lista cumple: ');
		writeln('==========================================');
		imprimir (lc);
		writeln ('Lista no cumple: ');
		writeln('==========================================');
		imprimir (lnc);
	end.
