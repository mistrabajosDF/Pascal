Program P5_e10;
//Lee informacion de fotos por teclado e informa:
//Título de la foto más vista
//Me gustas de las fotos de “Art Vandelay”
//Comentarios de cada foto

	type
		fotos=record
			titulo:string;
			autor:string;
			likes:integer;
			clicks:integer;
			comentarios:integer;
		end;

		Vfotos=array [1..3] of fotos;


	Procedure cargar (var f:Vfotos);
		var
			i:integer;
		begin
			for i:=1 to 3 do begin
				with f[i] do begin
					write ('Ingrese titulo de la foto: ');
					readln (titulo);
					write ('Ingrese autor de la foto: ');
					readln (autor);
					write ('Ingrese cantidad de me gusta: ');
					readln (likes);
					write ('Ingrese cantidad de clicks: ');
					readln (clicks);
					write ('Ingrese cantidad de comentarios: ');
					readln (comentarios);
					writeln('==================================');
				end;
			end;
		end;

	Procedure masvista (f:Vfotos);
		var
			i, masclicks:integer; titfoto:string;
		begin
			masclicks:=-1;
			for i:=1 to 3 do begin
				if (f[i].clicks>masclicks) then begin
					titfoto:=f[i].titulo;
					masclicks:=f[i].clicks;
				end;
			end;
			writeln('=========================================================================');
			writeln ('La foto mas vista es: ', titfoto);
		end;

	Procedure Tcomentarios (f:Vfotos);
		var
			i:integer;
		begin
			writeln('=========================================================================');
			for i:=1 to 3 do
				writeln ('La foto numero ', i, ' recibio ', f[i].comentarios, ' comentarios.');
		end;

	Procedure megusta (f:Vfotos);
		var
			total, i:integer;
		begin
			total:=0;
				for i:=1 to 3 do begin
					if (f[i].autor='Art Vandelay') then
						total:=total+f[i].likes;
				end;
			writeln('=========================================================================');
			writeln ('El total de me gusta que recibieron las fotos de Art Vandelay es: ', total);
			writeln('=========================================================================');
		end;

	var
		f:Vfotos;
	begin
		cargar (f);
		masvista (f);
		Tcomentarios (f);
		megusta (f);
	end.

	//Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.

