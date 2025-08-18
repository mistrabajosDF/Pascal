Program P7E14;
//se almacena información de viajes de alumnos e informa:
//cantidad de alumnos que realizan más de 6 viajes por día
//cantidad de alumnos que gastan en transporte más de $80 por día
//dos medios de transporte más utilizados.
//cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.	
	type
		alumno=record
			codigo:integer; //1 a 1300, puede sacarse si va arreglo
			ddm:integer;
			facultad:string;
			transporte:integer; //1cole urbano; 2cole interurbano; 3tren universitario; 4tren Roca; 5bicicleta. puede ser mas de auno
			transporte2:integer;
			transporte3:integer;
			transporte4:integer;
		end;

		lista = ^nodo;

		nodo=record
			dato:alumno;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; a:alumno);
		var
			aux : lista;
		begin
			new(aux);
			aux^.dato:= a;
			aux^.sig:=nil;
			If (l=nil) then
				L:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;

	Procedure leeralumno (var a:alumno);
		var
			confir:string;
		begin
			writeln('============================');
			write('Ingrese codigo de alumno: ');
			readln(a.codigo);
			if (a.codigo<>-1) then begin
				write('Ingrese dia del mes: ');
				readln(a.ddm);
				write('Ingrese facultad: ');
				readln(a.facultad);
				write('Ingrese transporte: ');
				readln(a.transporte);
				write('Usa otro medio de transporte? si/no ');
				readln(confir);
				if (confir='si') then begin //if 1 BIEN
					write('Ingrese transporte n2: ');
					readln(a.transporte2);
					write('Usa otro medio de transporte? si/no ');
					readln(confir);
					if (confir='si') then begin //if 2 
						writeln('Ingrese transporte n3: ');
						readln(a.transporte3);
						write('Usa otro medio de transporte? si/no ');
						readln(confir);
						if (confir='si') then begin //if 3
							writeln('Ingrese transporte n4: ');
							readln(a.transporte4);
						end //cierra if 3
						else //else if 3
							a.transporte4:=0;
					end //cierra if2
					else begin//enlse if2
						a.transporte3:=0;
						a.transporte4:=0;
					end; //cierra else 2
				end //cierra if 1
				else begin// else if 1
					a.transporte2:=0;
					a.transporte3:=0;
					a.transporte4:=0;
				end; //cierra else 1
			end;
		end; //ciera proceso

	Procedure cargarlista (var l, ult:lista);
		var
			a: alumno; 
		begin
			leeralumno (a);
			while (a.codigo<>-1) do begin
				NodoOrd (l, ult, a);
				leeralumno (a);
			end;
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('Codigo: ', p^.dato.codigo);
				writeln ('Dia del mes: ', p^.dato.ddm);
				writeln ('Facultad: ', p^.dato.facultad);
				writeln ('Transporte: ', p^.dato.transporte);
				if (p^.dato.transporte2<>0) then
					writeln ('Transporte: ', p^.dato.transporte2);
				if (p^.dato.transporte3<>0) then
					writeln ('Transporte: ', p^.dato.transporte3);
				if (p^.dato.transporte4<>0) then
					writeln ('Transporte: ', p^.dato.transporte3);
				p:=p^.sig;
				writeln('============================');
			end;
		end;

	var
		l, ult:lista;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
	end.
