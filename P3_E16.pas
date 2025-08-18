Program p3e16;
//Se validan dos secuencias A y B que deben cumplir: 
//Secuencia A no debe contener $
//Secuencia B debe tener el doble de caracteres que A y 3 arrobas

	Function nopeso (c:char):boolean;
		begin
			nopeso:=(c<>'$');
		end;

	Procedure cumplea (var cumple: boolean; var long:integer);
		////Se termina la carga de secuencia B con %
		//Ingresando $ no cumple
		//Ingresando otra cosa incrementa long
		var
			c:char;
		begin
			writeln ('Ingrese primer caracter de la secuencia A: ');
			readln (c);
			while (c<>'%') and (cumple=true) do begin
				if (not nopeso (c)) then
					cumple:=false
				else begin
					writeln ('Ingrese siguiente caracter de A: ');
					readln (c);
					long:=long+1;
				end;
			end;
			writeln ('Long: ', long);
			writeln ('===================================================');
		end;

	Procedure cumpleb (var cumple: boolean; long: integer);
		//Se termina la carga de secuencia B con *
		//Por cada @ se incrementa un contador
		//Por cada caracter ingresado se incrementa longz
		//Para que cumpla se deben haber ingresado al menos 3@ y 
		//el doble de caracteres que la secuencia A
		var
			c:char; longz:integer; arrobas:integer;
		begin
			longz:=0;
			arrobas:=0;
			writeln ('Ingrese primer caracter de la secuencia B: ');
			readln (c);
			while (c<>'*') do begin
				longz:=longz+1;
				if (c='@') then
					arrobas:=arrobas+1;
				writeln ('Ingrese siguiente caracter de B: ');
				readln (c);
			end;
			cumple:= (longz=long*2) and (arrobas <=3);
		end;

	var
		cumple:boolean; long: integer;

	begin
		cumple:=true;
		long:=0;
		cumplea (cumple, long);
		if (cumple) then begin {si A cumple}
			cumpleb (cumple, long);
			if (cumple) then {si B cumple}
				 writeln ('Se cumplio secuencia')
			else
				 writeln ('No se cumple B');
		end {end del if B}
		else
		writeln ('No se cumple A');
	end.
