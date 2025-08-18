Program p5e9;
//Guarda nombres en un vector (Max 500) o al leer ZZZ
//Leer un nombre y eliminar su primera aparicion en el vector
//Leer un nombre y insertarlo en la posicion 4
//Leer un nombre y agregarlo
	const
		fisica=7;

	type
		alumnos=array [1..7] of string;

	procedure cargar (var alum:alumnos; var dimL:integer); //CARGA NORMAL HASTA 500 O ZZZ
		var
			nombre:string;
		begin
			dimL:=0; {cant de datos que se ingresan}
			write ('Ingrese nombre del alumno: ');
			readln (nombre); {nombres que se ingresan}
			while (dimL<6) and (nombre<>'ZZZ') do begin {Hasta que se llena, o se ingrese ZZZ}
				dimL:=dimL+1;
				alum [dimL]:=nombre; {asignacion de nombre en posicion}
				write ('Ingrese nombre del alumno: ');
				readln (nombre); {nombres que se ingresan}
			end;
			writeln('===================================');
		end;

	Procedure eliminarnombre (var alum:alumnos; var dimL:integer; var pude:boolean; pos:integer);
		var
			i:integer;
		begin
			pude:=false;
			if ((pos>=1) and (Pos<=dimL)) then begin
				for i:=pos to (dimL-1) do
					alum [i]:=alum [i+1];
				pude:=true;
				dimL:=dimL-1;
			end;
		end;

	Procedure insertar (var alum:alumnos; var dimL:integer; valor:string; pos: integer; var pude:boolean); //c. Lea un nombre y lo inserte en la posición 4.
		var
			i:integer;
		begin
			pude:=false;
			if (((dimL+1)<=fisica) and (pos<=dimL) and (pos>=1)) then begin //al pedo y se podria sacar
				for i:=dimL downto pos do
					alum [i+1]:=alum [i];
				pude:=true;
				alum[pos]:=valor;
				diml:=diml+1;
			end;
		end;

	Procedure agregar (var alum:alumnos; var dimL:integer; var pude:boolean; valor:string);
		begin
			pude:=false;
			if ((dimL+1)<=fisica) then begin
				pude:=true;
				diml:=dimL+1;
				alum [dimL]:=valor;
			end;
		end;

	Function buscar (alum:alumnos; dimL:integer; buscado:string): integer;
		var
			pos:integer;
			esta:boolean;
		begin
			esta:=false;
			pos:=1;
			while (pos<=dimL) and (not esta) do begin
				if (alum [pos]=buscado) then
					esta:=true
				else
					pos:=pos+1;
			end;
			buscar:=pos;
		end;

	var
		alum:alumnos; dimL, pos, i:integer; 
		valor, buscado:string; 
		pude:boolean;
	begin
		pos:=0;
		cargar (alum, dimL);
		
		write ('Ingrese nombre buscado para eliminar: ');
		readln (buscado);
		pos:=buscar (alum, dimL, buscado);
		writeln ('La posicion es: ', pos);
		eliminarnombre (alum, dimL, pude, pos);
		
		writeln('===================================');
		write ('Ingrese nombre a insertar en la posicion 4: ');
		readln (valor);
		pos:=4;
		insertar (alum, dimL, valor, pos, pude);

		writeln('===================================');
		write ('Ingrese nombre a agregar al vector: ');
		readln (valor);
		agregar (alum, dimL, pude, valor);
		writeln('===================================');
		for i:=1 to dimL do begin
			writeln ('El alumno en la posicion ', i, ' es: ', alum [i]);
		end;
	end.
