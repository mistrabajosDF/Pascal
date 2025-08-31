{Módulo que genere un árbol binario de búsqueda con nombres de personas. 
La lectura finaliza con ‘ZZZ’. 
Módulo que reciba el árbol generado y un nombre, y retorne si existe dicho nombre.}

Program e9;
	type
		arbol=^nodo;
		nodo=record
			dato:string;
			hi:arbol;
			hd:arbol;
	end;

procedure cargar (var a:arbol; nombre:string);
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=nombre;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if (nombre<a^.dato) then
				cargar (a^.hi, nombre)
			else
				cargar (a^.hd, nombre);
end;

procedure enorden(a:arbol); //IMPRIME EN ORDEN CRECIENTE
	begin
		if (a<>nil) then begin
			enorden (a^.hi);
			write (a^.dato, ' '); //espacio para que sean legibles
			enorden (a^.hd);
		end;
end;

function buscar (a:arbol; nbus:string):boolean;
	begin
	if (a=nil) then
		buscar:=false
	else
		if (nbus=a^.dato) then
			buscar:=true
		else
			if (nbus<a^.dato) then
				buscar:=buscar (a^.hi, nbus)
			else
				buscar:=buscar (a^.hd, nbus);
	end;

var
		a:arbol; nombre, nbus:string;
	begin
		writeln ('Ingrese nombre: ');
		readln (nombre);
		while (nombre<>'ZZZ') do begin
			cargar (a, nombre);
			writeln ('Ingrese nombre: ');
			readln (nombre);
		end;
		writeln ('Nombres en orden:');
		enorden (a);
		writeln (' '); //espacio para ejecutar
		writeln ('Ingrese nombre a buscar: ');
		read (nbus);
		if (buscar (a, nbus)=true) then
			write ('El nombre esta.')
		else
			write ('El nombre no esta.');
end.
