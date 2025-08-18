Program P5E5;
//almacena en un vector numeros enteros leidos por teclado (a lo sumo 100)
//Se termina al ingresar el número 0. Despues intercaminar la posición del
//mayor elemento por la del menor elemento, e informe la operación realizada
	type
		numeros=array [1..10] of integer;

	Procedure Cargar (var comp:numeros; var dimL:integer); 
		var
			num:integer;
		begin
			dimL:=0; {cant de datos que se ingresan}
			write ('Ingrese numero: ');
			readln (num); {nº que se ingresan}
			while (dimL<10) and (num<>0) do begin {Hasta 100 lugares, o que se ingrese 0}
				dimL:=dimL+1;
				comp [dimL]:=num; {asignacion de nº en posicion (orden inverso)}
				write ('Ingrese numero: ');
				readln (num); {nº que se ingresan}
			end;
		end;

	Procedure ElementoMaximo (dimL:integer; var comp:numeros; var posmax:integer); {retorna la posición del mayor elemento del vector}
		var
			pos, max:integer;
		begin
			pos:=1;
			max:=0;
			while (pos<=dimL) do begin
				if (max<comp [pos]) then begin
					max:=comp [pos];
					posmax:=pos;
				end; {end del if}
				pos:=pos+1;
			end; {end del mientras}
		end;

	Procedure Elementominimo (dimL:integer; var comp:numeros; var posmin:integer); {retorna la posición del menor elemento del vector}
		var
			pos, min:integer;
		begin
			pos:=1;
			min:=32000;
			while (pos<=dimL) do begin
				if (comp [pos]<min) then begin
					min:=comp [pos];
					posmin:=pos;
				end; {end del if}
				pos:=pos+1;
			end; {end del mientras}
	end;

	Procedure intercambio (var comp:numeros; x, y:integer); {recibe  ​x​,​y ​(entre 1 y 100) y el vector. Retorna el mismo vector donde se intercambiaron los valores de las posiciones ​x​ e ​y​}
		var
			x1, y1:integer;
		begin
			x1:=comp[x];
			y1:=comp[y];
			comp [x]:=y1;
			comp [y]:=x1;
		end;

	Procedure ImprimirOrden(comp:numeros; dimL:integer);
		var
			i, x:integer;
		begin
			writeln ('====================================================');
			for i:=1 to dimL do begin
				x:= comp [i]; {Le asigna a x el valor guardado en una posicion}
				writeln ('El valor almacenado en ', i, ' es: ', x);
			end;
			writeln ('====================================================');
		end;

	//PROGRAMA PRINCIPAL
	var
		comp:numeros; dimL, posmax, posmin:integer;
	begin
		Cargar (comp, dimL);
		writeln ('===================');
		writeln ('DimlL: ', dimL);
		writeln ('===================');
		ElementoMaximo (dimL, comp, posmax);
		writeln ('Pos max: ', posmax);
		writeln ('===================');
		ElementoMinimo (dimL, comp, posmin);
		writeln ('Pos min: ', posmin);
		Intercambio (comp, posmin, posmax);
		ImprimirOrden (comp, dimL);
		writeln ('El elemento maximo que se encontraba en la posicion ', posmax, ' fue intercambiado con el elemento minimo que se encontraba en la posicion ', posmin);
	end.

