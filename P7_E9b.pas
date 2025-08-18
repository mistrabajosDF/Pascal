program JugamosConListas; 
//eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor 
//la lista podría no estar ordenada.
	type
		lista = ^nodo;
		nodo = record
			num : integer;
			sig : lista;
		end;

	var
		pri : lista;
		valor : integer;

	procedure armarNodo(var L : lista; v : integer);
		var
			aux : lista;
		begin
			new(aux);
			aux^.num := v;
			aux^.sig := L;
			L := aux;
		end;

	//c)
	Procedure imprimirlista (p:lista);
		begin
			writeln ('=============================');
			writeln ('Imprimiendo lista...');
			while (p<> nil) do begin
				writeln ('Elemento de la lista: ', p^.num);
				p:=p^.sig;
			end;
		end;

	Procedure eliminar (var p:lista; elim:integer);
		var
			act, ant:lista;
		begin
			act:=p;
			while (act<>nil) and (act^.num<>elim) do begin
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

	var
		elim:integer;
	begin
		pri:= nil;
		writeln('ingrese un numero');
		read(valor);
		while(valor <> 0) do begin
			armarNodo(pri, valor);
			writeln('Ingrese un numero');
			read(valor);
		end;
		imprimirlista (pri);
		writeln('Ingrese numero a eliminar');
		read (elim);
		eliminar (pri, elim);
		imprimirlista (pri);
	end.
