Program p3e12;
//Dados 10 pares de numeros ingresados por teclado calcula la suma y el 
//producto entre ellos o, si la multiplicacion excede el rango, lo informa
	var
		numx, numy, i:integer;
		multi, suma:longint;
		fueraDeRango: boolean;
	begin
		for i:=1 to 10 do begin
			write ('Ingrese numero X: ');
			readln(numx);
			write ('Ingrese numero Y: ');
			readln(numy);
			if (numx<>0) and (numy<>0) then
				fueraDeRango:=true
			else
				fueraDeRango:=false;

			if (numx>numy) then begin
				suma:=numx;
				multi:=numx;
				while(numx<>numy) do begin
					numx:=numx-1;
					suma:=suma+numx;
					multi:=multi*numx;
				end;
			end;

			if (numy>numx) then begin
				suma:=numy;
				multi:=numy;
				while(numx<>numy) do begin
					numy:=numy-1;
					suma:=suma+numy;
					multi:=multi*numy;
				end;
			end;
			writeln('-------------------------');
			writeln ('La suma de los numeros entre X e Y inclusive es: ', suma);
			if (multi=0) and (fueraDeRango=true) then
				writeln ('La multiplicacion de los numeros entre X e Y inclusive queda fuera de rango')
			else
				writeln ('La multiplicacion de los numeros entre X e Y inclusive es: ', multi);
			writeln('================================================================');
		end;
	end.
