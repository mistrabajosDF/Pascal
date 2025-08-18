Program p5e13;
//Carga informacion de galaxias e informa:
//cantidad de cada tipo, masa total acumulada de la Vía Láctea, Andrómeda y Triángulo y
//el porcentaje que esto representa respecto a la masa de todas las galaxias, 
//cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc, 
//nombre de las dos galaxias con mayor y menor masa.
	const
		fisica=5; {deberia ser 53}
	type
		galaxias=record
			nombre:string;
			tipo:integer;
			masa:integer;
			distancia:integer;
		end;

		Vgalaxias=array [1..fisica] of galaxias;

	Procedure cargar (var v:Vgalaxias; var dimL:integer);
		var
			i:integer;
		begin
			diml:=0;
			for i:=1 to fisica do begin
				write ('Ingrese nombre de la galaxia: ');
				readln (v[i].nombre);
				write ('Ingrese numero de tipo de galaxia (1. eliptica, 2. espiral, 3. lenticular, 4.irregular): ');
				readln (v[i].tipo);
				write ('Ingrese masa en kg: ');
				readln (v[i].masa);
				write ('Ingrese distancia en parsecs desde la Tierra: ');
				readln (v[i].distancia);
				dimL:=dimL+1;
				writeln('==========================================================================================');
			end;
		end;

	Procedure canttipo (v:Vgalaxias; dimL:integer); //cant de galaxias de cada tipo
		var
			cant1, cant2, cant3, cant4, i:integer;
		begin
			cant1:=0; cant2:=0; cant3:=0; cant4:=0;
			for i:=1 to dimL do begin
				case v[i].tipo of
					1:cant1:=cant1+1;
					2:cant2:=cant2+1;
					3:cant3:=cant3+1;
					4:cant4:=cant4+1;
				end;
			end;
			writeln('La cantidad de galaxias tipo 1. eliptica es: ', cant1);
			writeln('La cantidad de galaxias tipo 2. espiral es: ', cant2);
			writeln('La cantidad de galaxias tipo 3. lenticular es: ', cant3);
			writeln('La cantidad de galaxias tipo 4. irregular es: ', cant4);
			writeln('==========================================================================================');
		end;

	Procedure masatotal (v:Vgalaxias; diml:integer); //masa total de Vía Láctea, Andrómeda y Triángulo y el porcentaje que representa respecto a la masa de todas.
		var
			total3, total, i:integer; porcentaje:real;
		begin
			total:=0;
			total3:=0;
			for i:=1 to dimL do begin
				total:=total+v[i].masa;
				if (v[i].nombre='Via Lactea') or (v[i].nombre='Andromeda') or (v[i].nombre='Triangulo') then
					total3:=total3+v[i].masa;
			end;
			porcentaje:=(100/total)*total3;
			writeln ('La masa total de la Via Lactea, la Andromeda y Triangulo es: ', total3, '. Esto respresenta un ', porcentaje:8:2, ' porciento del total.');
			writeln('==========================================================================================');
		end;

	Procedure irregulares (v:Vgalaxias; dimL:integer); //cant de galaxias no irregulares que se encuentran a menos de 1000 pc.
		var
			cant, i:integer;
		begin
			cant:=0;
			for i:=1 to dimL do begin
				if (v[i].distancia<1000) and (v[i].tipo<>4) then
					cant:=cant+1;
			end;
			writeln ('La cantidad total de de galaxias no irregulares que se encuentran a menos de 1000 pc es: ', cant);
			writeln('==========================================================================================');
		end;

	Procedure masa (v:Vgalaxias; dimL:integer); //el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.
		var
			i, galaxiamax, galaxiamax2, galaxiamin, galaxiamin2:integer; 
			nombremax, nombremax2, nombremin, nombremin2:string; 
		begin
			galaxiamax:=-1;
			galaxiamax2:=-1;
			galaxiamin:=10000;
			galaxiamin2:=10000;
			for i:=1 to dimL do begin

			if (galaxiamax<v[i].masa) then begin
				galaxiamax2:=galaxiamax;
				galaxiamax:=v[i].masa;
				nombremax2:=nombremax;
				nombremax:=v[i].nombre;
			end {end del if}
			else
				if (v[i].masa>galaxiamax2) then begin
					nombremax2:=v[i].nombre;
					galaxiamax2:=v[i].masa;
				end;

			if (galaxiamin>v[i].masa) then begin
				galaxiamin2:=galaxiamin;
				galaxiamin:=v[i].masa;
				nombremin2:=nombremin;
				nombremin:=v[i].nombre;
			end {end del if}
			else
				if (v[i].masa<galaxiamin2) then begin
					nombremin2:=v[i].nombre;
					galaxiamin2:=v[i].masa;
				end;
			end;
			writeln ('Las galaxias con mas masa son: ', nombremax, ' y ', nombremax2);
			writeln ('Las galaxias con menos masa son: ', nombremin, ' y ', nombremin2);
			writeln('==========================================================================================');
		end;


	var
	v:Vgalaxias; dimL:integer;
	begin
	cargar (v, dimL);
	canttipo(v, dimL);
	masatotal (v, dimL);
	irregulares (v, dimL);
	end.
