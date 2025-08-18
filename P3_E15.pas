Program P3E15;
//Dadas dos secuencias por teclado, revisa que cumplan:
//Sec A no debe contener consonantes y su carga termina con $
//Sec B no debe contener vocales y su carga termina con #

	Function vocal (c:char):boolean;
		begin
			vocal:=(c='a') or (c='e') or (c='i') or (c='o') or (c='u') or (c='A') or (c='E') or (c='I') or (c='O') or (c='U');
		end;

	Function novocal (c:char):boolean;
		begin
			novocal:=(c<>'a') and (c<>'e') and (c<>'i') and (c<>'o') and (c<>'u') and (c<>'A') and (c<>'E') and (c<>'I') and (c<>'O') and (c<>'U');
		end;

	Procedure cumplea (var cumple: boolean);
		//La secuencia A no debe contener consonantes
		//Se termina su carga con $
		var
			c:char;
		begin
			writeln ('Ingrese primer caracter de secuencia A: ');
			readln (c);
			while (c<>'$') and (cumple=true) do begin
				if (not vocal (c)) then
					cumple:=false
				else begin
					writeln ('Ingrese siguiente caracter de A: ');
					readln (c);
				end;
			end;
		end;

	Procedure cumpleb (var cumple: boolean);
		//La secuencia B no debe contener vocales
		//Se termina su carga con #
		var
			c:char;
		begin
			writeln ('=======================================');
			writeln ('Ingrese secuencia B: ');
			readln (c);
			while (c<>'#') and (cumple=true) do begin
				if (not novocal (c)) then
					cumple:=false
				else begin
					writeln ('Ingrese siguiente caracter de B: ');
					readln (c);
				end;
			end;
		end;

	var
		cumple:boolean;

	begin
		cumple:=true;
		cumplea (cumple);
		if (cumple) then begin {si A cumple}
			cumpleb (cumple);
			if (cumple) then begin{si B cumple}
				writeln ('=======================================');
				 writeln ('Se cumplio secuencia');
			end
			else begin
				writeln ('=======================================');
				 writeln ('No se cumple B');
			end;
		end {end del if B}
		else begin
			writeln ('=======================================');
			writeln ('No se cumple A');
		end;
	end.
