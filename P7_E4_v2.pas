program JugamosConListas; 
//A partir del 1, hacer los modulos:
//maximo : recibe la lista y retorna el máximo
//minimo: recibe la lista y retorna el mínimo
//multiplos: recibe la lista y un valor entero, y retorna la cantidad 
//de elementos que son múltiplos de A.
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
			writeln ('proceso impri');
			while (p<> nil) do begin
				writeln ('Elemento de la lista: ', p^.num);
				p:=p^.sig;
			end;
		end;

	function maximo (p:lista):integer;
		var
			max:integer;
		begin
			max:=-1;
			while (p<> nil) do begin
				If (p^.num>max) then
					max:=p^.num;
				p:=p^.sig;
			end;
			maximo:=max;
		end;

	function minimo (p:lista):integer;
		var
			min:integer;
		begin
			min:=32000;
			while (p<> nil) do begin
				If (p^.num<min) then
					min:=p^.num;
				p:=p^.sig;
			end;
			minimo:=min;
		end;

	Function multi (p:lista; mul:integer):integer;
		var
			cantmulti:integer;
		begin
			cantmulti:=0;
			while (p<> nil) do begin
				If ((p^.num mod mul)=0) then
					cantmulti:=cantmulti+1;
				p:=p^.sig;
			end;
			multi:=cantmulti;
		end;

	var
		max, min, mul, cantmul:integer;
	begin
		mul:=0;
		pri:= nil;
		writeln('ingrese un numero');
		read(valor);
		while(valor <> 0) do begin
			armarNodo(pri, valor);
			writeln('Ingrese un numero');
			read(valor);
		end;
		imprimirlista (pri);
		max:=maximo (pri);
		min:=minimo (pri);
		writeln ('El valor maximo es: ', max);
		writeln ('El valor minimo es: ', min);
		writeln ('Ingrese valor a buscar multiplos: ');
		readln (mul);
		cantmul:=multi(pri, mul);
		writeln('La cantidad de elementos que son multiplos del valor ingresado es: ', cantmul);
	end.
