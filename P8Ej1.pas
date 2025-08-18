Program P8E1;

	type
		actor=record
			dni:longint;
			apellido, nombre:string;
			edad, codigo: integer; //(1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror)
		end;

		lista = ^nodo;

		nodo=record
			dato:actor;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; a:actor);
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

	Procedure leeractor (var a:actor);
		begin
			write('Ingrese dni: ');
			readln(a.dni);
			write('Ingrese apellido: ');
			readln(a.apellido);
			write('Ingrese nombre: ');
			readln(a.nombre);
			write('Ingrese edad: ');
			readln(a.edad);
			write('Ingrese codigo: ');
			readln(a.codigo);
		end;

	Procedure cargarlista (var l, ult:lista);
		var
			a: actor;
		begin
			repeat
				leeractor (a);
				NodoOrd (l, ult, a);
			until (a.dni=33555444);
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('DNI: ', p^.dato.dni);
				writeln ('Apellido: ', p^.dato.apellido);
				writeln ('Nombre: ', p^.dato.nombre);
				writeln ('Edad: ', p^.dato.edad);
				writeln ('Codigo: ', p^.dato.codigo);
				writeln('=============================');
				p:=p^.sig;
			end;
		end;

	procedure parimpar (p:lista); //Cantidad de personas cuyo DNI contiene más dígitos pares que impares.
		var
			par, impar, cantp, num:integer;
		begin
			cantp:=0;
			while (p<> nil) do begin
			par:=0;
			impar:=0;
			num:=p^.dato.dni;
			while (num<>0)  do begin
			if ((num mod 2)=1) then
				impar:=impar+1
			else
			if ((num mod 2)=0) and (num<>0) then
				impar:=impar+1;
				num:=num div 10
			end;
			if (par>impar) then
				cantp:=cantp+1;
				p:=p^.sig;
			end;
			writeln ('Cantidad de personas cuyo DNI contiene mas digitos pares que impares: ', cantp);
		end;

	procedure eliminar (var p:lista; valore:longint); //reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no existir.
		var
			act, ant:lista;
		begin
			act:=p;
			while (act<>nil) and (act^.dato.dni<>valore) do begin
			ant:=act;
			act:=act^.sig;
			end;
			if (act<>nil) then
				if (act=p) then begin
					p:=p^.sig;
					dispose (act);
				end
				else begin
					ant^.sig:=act^.sig;
					dispose (act);
				end;
		end;

	procedure codmas (p:lista); //Informar los dos códigos de género más elegidos
		var
			cant:array [1..5] of integer; i:integer; max1, max2, cod1, cod2:integer;
		begin
			for i:=1 to 5 do //inicializar en 0 todo el arreglo
				cant [i]:=0;
			while (p<>nil) do begin
				cant [p^.dato.codigo]:=cant[p^.dato.codigo]+1;
				p:=p^.sig;
			end; //while
			max1:=-1;
			max2:=-1;
			for i:=1 to 5 do begin
				if (cant [i]>max1) then begin
					max2:=max1;
					cod2:=cod1;
					cod1:=i;
					max1:=cant [i];
				end
				else
					if (cant [i]>max2) then begin
						max2:=cant [i];
						cod2:=i;
					end; //if
			end; //2do for
			writeln ('Los codigos de los dos generos mas elegidos son: ', cod1, ' y ', cod2);
		end;

	var
		l, ult:lista; valore:longint;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
		parimpar (l);
		codmas (l);
		writeln ('Ingrese dni a eliminar:');
		readln (valore);
		eliminar(l, valore);
		imprimirlista(l);
	end.

	//b. Informar los dos códigos de género más elegidos.
