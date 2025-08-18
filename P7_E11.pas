Program p7_e11;
//se lee la informacion de egresados hasta ingresar codigo 0 y se informa, 
//los 3 mejores promedios ordenados descendente por este dato 
	type
		alumno=record
			nalum:integer;
			apellido:string;
			prom:real;
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
		begin
			write('Ingrese numero de alumno: ');
			readln(a.nalum);
			if (a.nalum<>0) then begin
				write('Ingrese apellido del alumno: ');
				readln(a.apellido);
				write('Ingrese promedio del alumno: ');
				readln(a.prom);
			end;
			writeln('=====================================');
		end;

	Procedure cargarlista (var l, ult:lista);
		var
			a: alumno;
		begin
			leeralumno (a);
			while (a.nalum<>0) do begin
				NodoOrd (l, ult, a);
				leeralumno (a);
			end;
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('Num de alumno: ', p^.dato.nalum);
				writeln ('Apellido del alumno: ', p^.dato.apellido);
				writeln ('Promedio del alumno: ', p^.dato.prom:8:2);
				p:=p^.sig;
				writeln('=====================================');
			end;
		end;

	Procedure promedio (p:lista); //deberian ser los 10 mejores, JAJAJAJAJAJAJAJA
		var
			pro1, pro2, pro3:real; ap1, ap2, ap3:string; nal1, nal2, nal3:integer;
		begin
			pro1:=0;
			pro2:=0;
			pro3:=0;
			while (p<> nil) do begin
			if (p^.dato.prom>pro1) then begin
				pro3:=pro2;
				ap3:=ap2;
				nal3:=nal2;

				pro2:=pro1;
				ap2:=ap1;
				nal2:=nal1;

				pro1:=p^.dato.prom;
				ap1:=p^.dato.apellido;
				nal1:=p^.dato.nalum;
			end
			else
				if (p^.dato.prom>pro2) then begin
					pro3:=pro2;
					ap3:=ap2;
					nal3:=nal2;

					pro2:=p^.dato.prom;
					ap2:=p^.dato.apellido;
					nal2:=p^.dato.nalum;
				end
			else
				if (p^.dato.prom>pro3) then begin
					pro3:=p^.dato.prom;
					ap3:=p^.dato.apellido;
					nal3:=p^.dato.nalum;
				end;
			p:=p^.sig;
			end;
			writeln ('El primer puesto es: ', ap1, ', num de alumno: ', nal1);
			writeln ('El segundo puesto es: ', ap2, ', num de alumno: ', nal2);
			writeln ('El tercer puesto es: ', ap3, ', num de alumno: ', nal3);
		end;

	var
		l, ult:lista;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
		promedio (l);
	end.
