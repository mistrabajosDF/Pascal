program JugamosConListas; 
//sublista: recibe la lista y dos valores, y retorna una nueva lista con todos los
//elementos de la lista L mayores que A y menores que B
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
			writeln ('==================================');
			writeln ('Imprimiendo lista...');
			while (p<> nil) do begin
				writeln ('Elemento de la lista: ', p^.num);
				p:=p^.sig;
			end;
		end;

	procedure separarlistas (pri:lista; var l1:lista; a, b:integer);
		begin
			l1:=nil;
			while (pri<>nil) do begin
				if (pri^.num<b) and (pri^.num>a) then
					armarnodo (l1, pri^.num);
				pri:=pri^.sig;
			end;
		end;

	var
		l1:lista; a, b:integer;
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
		writeln ('Ingrese valor A (Menor): ');
		readln (a);
		writeln ('Ingrese valor B (Mayor): ');
		readln (b);
		separarlistas (pri, l1, a, b);
		imprimirlista (l1);
	end.
