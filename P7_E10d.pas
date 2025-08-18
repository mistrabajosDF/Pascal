Program mau;
	type
		cliente=record
			dni:integer;
			num:integer;
		end;

		lista = ^nodo;

		nodo=record
			dato:cliente;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; c:cliente);
		var
			aux : lista;
		begin
			new(aux);
			aux^.dato:= c;
			aux^.sig:=nil;
			If (l=nil) then
				L:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;

	Procedure leercliente (var c:cliente; var turno:integer; dni:integer);
		begin
			turno:=turno+1;
			c.dni:=dni;
			c.num:=turno;
		end;

	Procedure Recibircliente (var l, ult:lista; dni:integer; var turno:integer);
		var
			c:cliente;
		begin
			leercliente (c, turno, dni);
			NodoOrd (l, ult, c);
		end;

	Procedure imprimirlista (p:lista);
		begin
			writeln ('============================');
			while (p<> nil) do begin
				writeln ('DNI: ', p^.dato.dni);
				writeln ('Turno: ', p^.dato.num);
				writeln ('=============');
				p:=p^.sig;
			end;
		end;

	Procedure atendercliente (var p:lista);
		var
			act:lista;
		begin
			act:=p;
			if(act=p) then
				p:=p^.sig;
			dispose (act);
		end;

	var
		dni, turno:integer; l, ult:lista;
	begin
		turno:=0;
		l:= nil;
		write('Ingrese dni: ');
		read(dni);
		while (dni<>0) do begin
			recibircliente (l, ult, dni, turno);
			write('Ingrese dni: ');
			read(dni);
		end;
		imprimirlista (l);
		atendercliente (l);
		writeln('Lista despues de atender cliente:');
		imprimirlista (l);
	end.
