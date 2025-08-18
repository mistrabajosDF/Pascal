Program P5E7;
//Carga numeros por teclado hasta 10 o ingresar -1 e informa:
//cantidad de veces que aparecio cada numero, dígito más leído y
//los dígitos que no tuvieron ocurrencias.
	type
		numeros=array [1..10] of integer;

	Procedure Cargar (var comp:numeros; var dimL:integer); {lee nº Z hasta -1 (que no debe procesarse)}
		var
			num:integer;
		begin
			dimL:=0; {cant de datos que se ingresan}
			writeln ('Ingrese numero: ');
			readln (num); {nº que se ingresan}
			while (dimL<10) and (num<>-1) do begin {Hasta 10 lugares, o que se ingrese -1} //Que dimension se deberia poner aca si no especifica?
				dimL:=dimL+1;
				comp [dimL]:=num; {asignacion de nº en posicion (orden inverso)}
				writeln ('Ingrese numero: ');
				readln (num); {nº que se ingresan}
			end;
		end;

	Procedure cantidadN (comp:numeros; dimL:integer; var cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve:integer); {veces que aparecio cada numero como caracter (0a9) entre los componentes leidos}
		var
			i, digito, caracter:integer;

		begin
			cero:=0; uno:=0; dos:=0; tres:=0; cuatro:=0; cinco:=0; seis:=0; siete:=0; ocho:=0; nueve:=0;
			for i:=1 to dimL do begin
				digito:=comp [i];

				while (digito<>0) do begin
					caracter:=(digito mod 10);
					
					case caracter of
						0: cero:=cero+1;
						1: uno:=uno+1;
						2: dos:=dos+1;
						3: tres:=tres+1;
						4: cuatro:=cuatro+1;
						5: cinco:=cinco+1;
						6: seis:=seis+1;
						7: siete:=siete+1;
						8: ocho:=ocho+1;
						9: nueve:=nueve+1;
					end;
					
					digito:=digito div 10;
				end; {del while}
			end; {del for}
			writeln ('El 0 aparecio ', cero, ' veces.');
			writeln ('El 1 aparecio ', uno, ' veces.');
			writeln ('El 2 aparecio ', dos, ' veces.');
			writeln ('El 3 aparecio ', tres, ' veces.');
			writeln ('El 4 aparecio ', cuatro, ' veces.');
			writeln ('El 5 aparecio ', cinco, ' veces.');
			writeln ('El 6 aparecio ', seis, ' veces.');
			writeln ('El 7 aparecio ', siete, ' veces.');
			writeln ('El 8 aparecio ', ocho, ' veces.');
			writeln ('El 9 aparecio ', nueve, ' veces.');
		end;


	Procedure masLeido (cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve:integer); {el numero (0 a 9) más leído}
		var
			numMax:integer; ganador:integer;
		begin
			numMax:=0;
			if (cero>numMax) then begin
				ganador:=0;
				numMax:=cero;
			end;
			if (uno>numMax) then begin
				ganador:=1;
				numMax:=uno;
			end;
			if (dos>numMax) then begin
				ganador:=2;
				numMax:=dos;
			end;
			if (tres>numMax) then begin
				ganador:=3;
				numMax:=tres;
			end;
			if (cuatro>numMax) then begin
				ganador:=4;
				numMax:=cuatro;
			end;
			if (cinco>numMax) then begin
				ganador:=5;
				numMax:=cinco;
			end;
			if (seis>numMax) then begin
				ganador:=6;
				numMax:=seis;
			end;
			if (siete>numMax) then begin
				ganador:=7;
				numMax:=siete;
			end;
			if (ocho>numMax) then begin
				ganador:=8;
				numMax:=ocho;
			end;
			if (nueve>numMax) then begin
				ganador:=9;
				numMax:=nueve;
			end;
			Writeln ('El numero que ha aparecido mas veces es: ', ganador);
		end;

	Procedure noLeidos (cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve:integer); {los dígitos (0 a 9) que no aparecieron jamas}
		begin
			if (cero=0) then
				writeln ('El cero no aparece');
			if (uno=0) then
				writeln ('El uno no aparece');
			if (dos=0) then
				writeln ('El dos no aparece');
			if (tres=0) then
				writeln ('El tres no aparece');
			if (cuatro=0) then
				writeln ('El cuatro no aparece');
			if (cinco=0) then
				writeln ('El cinco no aparece');
			if (seis=0) then
				writeln ('El seis no aparece');
			if (siete=0) then
				writeln ('El siete no aparece');
			if (ocho=0) then
				writeln ('El ocho no aparece');
			if (nueve=0) then
				writeln ('El nueve no aparece');
		end;


	//PROGRAMA PRINCIPAL
	var
		comp:numeros; dimL, cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve:integer;
	begin
		Cargar (comp, dimL);
		writeln('========================================================');
		cantidadN (comp, dimL, cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve);
		writeln('========================================================');
		masLeido (cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve);
		writeln('========================================================');
		noLeidos (cero, uno, dos, tres, cuatro, cinco, seis, siete, ocho, nueve);
	end.
