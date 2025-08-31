{Procesamiento de productos con código del producto, código de rubro (del 1 al 6) y precio.
a. Lea los datos y almacene ordenados por código de producto y
agrupados por rubro. El ingreso de los productos finaliza con precio -1.

Muestre los códigos de los productos pertenecientes a cada rubro:
b. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3.
Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de
productos del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e
ignore el resto.
c. Ordene, por precio, los elementos del vector generado en b).
d. Muestre los precios del vector ordenado.}

Program e2;

type
producto=record
	cod:integer;
	rubro:integer;
	precio:real;
end;

lista=^nodo;

nodo=record
	dato:producto;
	sig:lista;
end;

vrubro3=array [1..30] of producto;

procedure NodoOrd(var l, ult : lista; p:producto);
	var
		aux, act, ant : lista;
	begin
		new(aux);
		aux^.dato:= p;
		aux^.sig:=nil;
		If (l=nil) then
			L:=aux
		else begin
			ant:= l;
			act:= l;
			while ((act <> nil) and (act^.dato.rubro < p.rubro)) do begin
				ant:= act;
				act:= act^.Sig;
			end;
			while ((act <> nil) and (act^.dato.rubro=p.rubro)) do begin
				ant:= act;
				act:= act^.Sig;
			end;
			if (act = L) then begin
				aux^.sig:= l;
				l:= aux;
			end
			else begin
				ant^.sig:= aux;
				aux^.sig:= act;
			end;
		end;
end;

Procedure leerproducto (var p:producto);
	begin
		writeln('Ingrese precio: ');
		readln(p.precio);
		if (p.precio<>-1) then begin
			writeln('Ingrese codigo: ');
			readln(p.cod);
			writeln('Ingrese rubro: ');
			readln(p.rubro);
		end;
end;

Procedure cargarlista (var l, ult:lista);
	var
		p:producto;
	begin
		leerproducto (p);
		while (p.precio<>-1) do begin
			NodoOrd (l, ult, p);
			leerproducto (p);
		end;
	end;

procedure codprod (l:lista); //muestra los codigos de los productos de cada rubro
	var
		rubroact: integer;
	begin
		writeln ('=====Productos=====');
		while (l<> nil) do begin
			rubroact:=l^.dato.rubro;
			writeln ('Productos pertenecientes al rubro: ', rubroact, ': ');
			while (l<>nil) and (rubroact=l^.dato.rubro)do begin
				writeln ('Codigo: ', l^.dato.cod);
				l:=l^.sig;
			end;
		end;
	end;

procedure rubro3 (var vr:vrubro3; var diml:integer; l:lista); //vector de dimF=30 con los productos del rubro 3.
	begin
		diml:=0;
		while (l<>nil) and (diml<30) do begin
			if (l^.dato.rubro=3) then begin
				diml:=diml+1;
				vr[diml].cod:=l^.dato.cod;
				vr[diml].rubro:=l^.dato.rubro;
				vr[diml].precio:=l^.dato.precio;
			end; //if
			l:=l^.sig;
		end; //while
	end;

procedure ordenarprecio (var vr:vrubro3; diml:integer); //Ordena por precio los elementos del vector
	var
		actual:producto; i, j:integer;
	begin
		for i:=2 to diml do begin
			actual:=vr[i];
			j:=i-1;
			while ((j>0) and (vr[j].precio>actual.precio)) do begin
				vr [j+1]:=vr[j];
				j:=j-1;
			end;
			vr[j+1]:=actual;
		end;
end;

procedure imprimirvector (vr:vrubro3; diml:integer);
	var
		i:integer;
	begin
		writeln ('=====Productos del rubro 3: =====');
		for i:=1 to diml do begin
			writeln ('Producto numero ', i);
			writeln ('Codigo: ', vr[i].cod);
			writeln ('Precio: ',vr[i].precio:8:2);
			writeln ('Rubro: ', vr[i].rubro);
		end;
end;

var
	l, ult:lista; vr:vrubro3; diml:integer;
begin
	l:= nil;
	cargarlista (l, ult);
	codprod (l);
	rubro3 (vr, diml, l);
	ordenarprecio (vr, diml);
	imprimirvector (vr, diml);
end.
