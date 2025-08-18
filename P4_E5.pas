Program P5E5;
//Dados candidatos con sus datos ingresados por teclado, informa cual 
//sacó mas votos y cual mas %.
	type
		candidato= record
			localidad: string;
			apellido: string;
			votos: integer;
			votantes: integer;
		end;

	Procedure leer (var c:candidato);
		begin
			write ('Ingrese apellido del candidato: ');
			readln (c.apellido);
			write ('Ingrese localidad: ');
			readln (c.localidad);
			write ('Ingrese cantidad de votos: ');
			readln (c.votos);
			write ('Ingrese cantidad de votantes: ');
			readln (c.votantes);
			writeln('================================');
		end;

	var
		candi: candidato; masvotos: integer; 
		candivoto, candiporc:string; 
		masporc: real;

	begin
		masvotos:=0;
		masporc:=0;
		repeat
			leer (candi);
			if (candi.votos>masvotos) then begin
				masvotos:=candi.votos;
				candivoto:=candi.apellido;
			end;
			if (candi.votos/candi.votantes>masporc) then begin
				masporc:=candi.votos/candi.votantes;
				candiporc:=candi.apellido;
			end;
		until (candi.localidad='Zarate');
		Writeln ('El intendente que obtuvo la mayor cantidad de votos fue: ', candivoto);
		writeln ('El intendente que obtuvo el mayor porcentaje de votos fue: ', candiporc);
	end.
