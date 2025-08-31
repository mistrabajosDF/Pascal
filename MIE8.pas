{a. Módulo que lea números enteros y los almacene en un árbol binario
de búsqueda. La lectura finaliza con el valor 0.
b. Realice módulos independientes para:
i. Obtener el número más grande.
ii. Obtener el número más chico.
iii. Obtener la cantidad de elementos.
iv. Informar los números en orden creciente.
v. Informar los números pares en orden decreciente.}

program e8;
type
	arbol=^nodo;
	nodo=record
		dato:integer;
		hi:arbol;
		hd:arbol;
end;

procedure cargar (var a:arbol; num:integer); //hay que hacer doble if
	begin
		if (a=nil) then begin
			new(a);
			a^.dato:=num;
			a^.hi:=nil;
			a^.hd:=nil;
		end
		else
			if (num<a^.dato) then
				cargar (a^.hi, num)
			else
				cargar (a^.hd, num);
end;

procedure posorden (a:arbol); //IMPRIME EN ORDEN INVERSO AL QUE SE CARGO
	begin
		if (a<>nil) then begin
			posorden (a^.hi);
			posorden (a^.hd);
			writeln (a^.dato);
		end;
end;

procedure preorden(a:arbol);
	begin
		if (a<>nil) then begin
			writeln (a^.dato);
			preorden (a^.hi);
			preorden (a^.hd);
		end;
end;

procedure enorden(a:arbol); //IMPRIME EN ORDEN CRECIENTE
	begin
		if (a<>nil) then begin
			enorden (a^.hi);
			write (a^.dato, ', '); 
			enorden (a^.hd);
		end;

end;

procedure pares(a:arbol); //IMPRIME PARES ORDEN DECRECIENTE
	begin
		if (a<>nil) then begin
			pares (a^.hd);
			if ((a^.dato mod 2)=0) then
				write (a^.dato, ' '); //espacio para que sean legibles
			pares (a^.hi);
		end;
end;

procedure mayor (a:arbol);
	begin
		if (a^.hd= nil) then
			writeLn('El numero mayor es: ', a^.dato)
		else
			mayor (a^.hd);
end;

procedure recorrido (a: arbol; var max: integer); //ejemlo de un parcial
	begin
		if(a<>nil) then begin
			if(a^.dato > max) then
				max:=a^.dato;
			recorrido(a^.HD,max);
		end;
end;

procedure menor (a:arbol);
	begin
		if (a^.hi= nil) then
			writeLn('El numero menor es: ', a^.dato)
		else
			menor (a^.hi);
end;

procedure cantidad (a:arbol; var cant:integer);
	begin
		if (a<>nil) then begin
			cantidad (a^.hi, cant);
			cant:=cant+1;
			cantidad (a^.hd, cant);
		end;
end;

var
	a:arbol; num, cant, mau1:integer;
begin
	writeln ('Ingrese numero: ');
	readln (num);
	while (num<>0) do begin
		cargar (a, num);
		writeln ('Ingrese numero: ');
		readln (num);
	end;
	writeln ('Numeros en orden creciente: ');
	enorden (a);
	writeln('');
	writeln ('______________'); //espacio para ejecutar
	mayor (a);
	menor (a);
	cant:=0;
	cantidad (a, cant);
	writeln ('La cantidad de elementos es: ', cant);
	writeln ('Numeros pares en orden decreciente: ');
	pares (a);
	writeln('');
	writeln ('______________');
	writeln('Preorden');
	preorden (a);
	writeln ('______________');
	writeln('Posorden');
	posorden (a);
	mau1:=0;
	recorrido(a, mau1);
	Writeln ('Cosa de parcial: ', mau1);
end.
