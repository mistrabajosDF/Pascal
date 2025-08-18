Program p5_p14;
//Se almacenan datos de mediciones anuales ordenadas por año. Luego se informa:
//año con mayor temperatura promedio a nivel mundial.
//año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.
	const
		fisica=6; {deberia ser 5000}
	type
		mediciones=record
			ano:integer;
			temperatura:real;
			lugar:string;
		end;

		Vmediciones=array [1..fisica] of mediciones;

	Procedure cargar (var v:Vmediciones; var dimL:integer);
		var
			i:integer;
		begin
			diml:=0;
			for i:=1 to fisica do begin
				write ('Ingrese ano de la medicion: ');
				readln (v[i].ano);
				write ('Ingrese temperatura de la medicion: ');
				readln (v[i].temperatura);
				write ('Ingrese lugar de la medicion: ');
				readln (v[i].lugar);
				dimL:=dimL+1;
				writeln('===============================================================================');
			end;
		end;

	Procedure anocaliente (v:Vmediciones; dimL:integer);
		var
			mascaliente:real; anomashot, i:integer;
		begin
			mascaliente:=-1;
			for i:=1 to dimL do begin
				if (mascaliente<v[i].temperatura) then begin
					mascaliente:=v[i].temperatura;
					anomashot:=v[i].ano;
				end; {end del if}
			end;
			writeln ('El ano con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 anios es: ', anomashot);
			writeln('===============================================================================');
		end;

	Procedure anopromedio (v:Vmediciones; dimL:integer); //- el año con mayor temperatura promedio a nivel mundial.
		var
			promedio, suma, promediomax:real; anomax, veces, i, j:integer;
		begin
		suma:=0;
		veces:=0;
		promediomax:=-1;
		for i:=1 to 3 do begin {deberia ser 50}
			for j:=1 to 2 do begin {deberia ser 100}
				suma:=suma+v[j].temperatura;
				veces:=veces+1;
				promedio:=suma/veces;
			end; {end segundo for}
			if (promedio>promediomax) then begin
				anomax:=v[i].ano;
				promediomax:=promedio;
			end; {end del if}
		end;
		writeln ('El anio con mayor temperatura promedio a nivel mundial: ', anomax);
		writeln('===============================================================================');
		end;

	var
		v:Vmediciones; dimL:integer;
	begin
		cargar (v, dimL);
		anocaliente (v, dimL);
		anopromedio (v, dimL)
	end.
