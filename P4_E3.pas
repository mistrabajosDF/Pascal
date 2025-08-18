Program mau;
//Carga dos escuelas, calcula su relacion alumnos/docentes, la informa y,
//al finalizar, informa la cantidad de escuelas de LP que superan la
//relacion 23.43 y cual es la que tiene la relacion mas baja
	type
		escuelas= record
			cue: integer;
			nombre: string;
			docentes: integer;
			alumnos: integer;
			localidad: string;
	end;

	Procedure leer (var e:escuelas);
		begin
			with e do begin
				write ('Ingrese CUE del establecimiento: ');
				readln (cue);
				write ('Ingrese nombre del establecimiento: ');
				readln (nombre);
				write ('Ingrese cantidad de docentes: ');
				readln (docentes);
				write ('Ingrese cantidad de alumnos: ');
				readln (alumnos);
				write ('Ingrese localidad: ');
				readln (localidad);
			end;
		end;

	Procedure calrelacion (var relacion:real; docentes, alumnos:integer);
		begin
			relacion:=alumnos/docentes;
		end;

	var
		escuelita: escuelas; relacion, reldocalum:real; cantlp, cuemej, i:integer; nombremej: string;

	begin
		cantlp:=0;
		reldocalum:=90000;
		for i:=1 to 2 do begin {En realidad son 2400}
			writeln('===========================================');
			leer (escuelita);
			calrelacion (relacion, escuelita.docentes, escuelita.alumnos);
			Writeln ('La relacion es: ', relacion:8:2);
			If (escuelita.localidad='La Plata') and (relacion>23.435) then
				cantlp:=cantlp+1;
			If (relacion<reldocalum) then begin
				reldocalum:=relacion;
				cuemej:=escuelita.cue;
				nombremej:=escuelita.nombre;
			end;
		end;
		writeln('================================================================================');
		writeln ('La cantidad de escuelas de La Plata que superan la relacion 23.435 es: ', cantlp);
		writeln ('El nombre de la escuela con mejor relacion alumnos/docentes es: ', nombremej,' y su CUE es: ', cuemej);
		writeln('================================================================================');
	end.
