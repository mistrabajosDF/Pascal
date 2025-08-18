Program P5E7;
//Carga numeros por teclado hasta 10 o ingresar -1 e informa:
//cantidad de veces que aparecio cada numero, dígito más leído y
//los dígitos que no tuvieron ocurrencias.
	type
		numeros=array [0..9] of integer;

	Procedure inicializar (var comp:numeros);
		var
			i:integer;
		begin
			for i:=0 to 9 do
				comp [i]:=0;
		end;

	Procedure descomponer (var comp:numeros; num:integer);
		var
			caracter:integer;
		begin
			while (num<>0) do begin
				caracter:=(num mod 10);
				comp [caracter]:= comp[caracter]+1;
				num:=num div 10;
			end; {del while}
		end;

	Procedure informar (comp:numeros);
		var
			i:integer;
		begin
			for i:=0 to 9 do
				if (comp[i]<>0) then
					writeln (i, ' aparecio ', comp[i], ' vez/veces.');
		end;

	Function DigitoMaximo (comp:numeros):integer;
		var
			i, digmax, max:integer;
		begin
			max:=-1;
			for i:=0 to 9 do
				if (comp[i]>max) then begin
					max:=comp[i];
					digmax:=i;
				end;
			DigitoMaximo:=digmax;
		end;

	Procedure noLeidos (comp:numeros);
		var
			i:integer;
		begin
			for i:=0 to 9 do begin
				if (comp [i]=0) then
					writeln ('El ', i, ' no aparece');
				end;
		end;

	var
		comp:numeros;
		num:integer;
	begin
		inicializar (comp);
		write ('Ingrese numero: ');
		read (num);
		inicializar (comp);
		while (num<>-1) do begin	
			descomponer (comp, num);
			write ('Ingrese numero: ');
			read (num);
		end;
			writeln('========================================================');
			informar (comp);
			writeln('========================================================');
			writeln ('El digito que mas aparece es: ', DigitoMaximo (comp));
			writeln('========================================================');
			noLeidos (comp);
			writeln('========================================================');
	end.
