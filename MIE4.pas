{a. Módulo que genere una lista de enteros. La lectura finaliza con el número 0.
b. Módulo recursivo que devuelva el mínimo valor de la lista.
c. Módulo recursivo que devuelva el máximo valor de la lista.
d. Módulo recursivo que devuelva si un valor determinado se encuentra en la lista.}

program e4; 

type
	lista = ^nodo;
	nodo = record
		dato : integer;
		sig : lista;
end;

procedure armarNodoatras(var l, ult : lista; num: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.dato := num;
		aux^.sig:=nil;
		If (l=nil) then
			l:=aux
		else
			ult^.sig:=aux;
			ult:=aux;
end;

procedure maximo (l:lista; var max: integer);
	begin
		if (l<>nil) then begin
			if (l^.dato>max) then
				max:=l^.dato;
			l:=l^.sig;
			maximo (l, max);
		end;
end;

procedure minimo (l:lista; var min: integer);
	begin
		if (l<>nil) then begin
			if (l^.dato<min) then
				min:=l^.dato;
			l:=l^.sig;
			minimo (l, min);
		end;
end;

function buscar (l:lista; bus:integer):boolean;
	begin
		if (l=nil) then
			buscar:=false
		else
			if (l^.dato=bus) then
				buscar:=true
			else begin
				l:=l^.sig;
				buscar:=buscar (l, bus);
			end
end;

////PROGRAMA PRINCIPAL////
var
	l, ult:lista; num, max, min, bus: integer; 
begin
	l:= nil;
	writeln('ingrese un numero');
	read(num);
	while(num <> 0) do begin
		armarNodoatras(l, ult, num);
		writeln('Ingrese un numero');
		read(num);
	end;
	///////
	max:=-1;
	maximo (l, max);
	writeln ('El numero maximo es: ', max);
	///////
	min:=30000;
	minimo (l, min);
	writeln ('El numero minimo es: ', min);
	///////
	writeln ('Ingrese numero a buscar: ');
	read (bus);
	if (buscar (l, bus)=true) then
		writeln ('El numero esta en la lista')
	else
		writeln ('El numero no esta en la lista');
end.
