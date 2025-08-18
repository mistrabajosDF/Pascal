program ejercicio2;
//Dado el siguiente código, ​identifique los 9 errores​.
	type
		lista= ^nodo; //bien

		persona = record //bien
			dni: integer;
			nombre: string;
			apellido: string;
		end;

		nodo = record //bien
			dato:persona;
			sig: lista;
		end;

	procedure leerPersona(var p : persona); //originalmente sin var
		begin
			writeln ('Ingrese DNI: '); //agregado solo para entender bien
			readln(p.dni);
			if(p.dni <> 0) then begin
				writeln ('Ingrese nombre: '); //agregado solo para entender bien
				readln(p.nombre);
				writeln ('Ingrese apellido: '); //agregado solo para entender bien
				readln(p.apellido);
			end;
			writeln ('Sale del if leer persona '); //agregado solo para entender bien
		end;

	{Agregar un nodo a la lista}

	procedure agregarAdelante(var l:lista; p : persona); //originalmente l:lista, sin var. bien
		var
			aux : lista;
		begin
			new (aux); //agregado por mi
			aux^.dato := p;
			aux^.sig := l;
			l := aux;
		end;

	{Carga la lista hasta que llega el dni 0}

	procedure generarLista(var l : lista); //bien
		var
			p : persona; //originalmente p :nodo;
		begin
			leerPersona(p);
			while (p.dni <> 0) do begin
				agregarAdelante(l,p);
				leerPersona(p); //agregado por mi
			end;
			writeln ('Sale del while generar lista '); //agregado solo para entender bien
		end;

	procedure imprimirInformacion(l : lista); //originalmente (var l : lista)
		begin
			while(l <> nil) do begin
				writeln('DNI: ', l^.dato.dni);
				writeln ('Nombre: ', l^.dato.nombre); //originalmente l^.nombre
				writeln ('Apellido: ', l^.dato.apellido); //originalmente l^.apellido
				l := l^.sig;
			end;
		end;

	{programa principal}
	var
		l : lista;
	begin
		l:=nil; //puesto por mi
		generarLista(l);
		imprimirInformacion(l);
	end.
