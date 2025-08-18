Program P4E6;
//Dados microprocesadores ingresados por teclado con sus datos, informa
//marca de micro con mas de 2 cores y transistores de, a lo sumo 22nm y
//marca con mas cantidad de procesadores con transistores de 14 nm.
//Se termina la carga con cantNucleos= 0
	Type
		micro=record
			marca: string;
			linea: string;
			nucleos: integer;
			veloc: integer;
			tamano: integer;
	end;

	Procedure leer (var m:micro);
		begin
			write ('Ingrese marca: ');
			readln (m.marca);
			write ('Ingrese linea: ');
			readln (m.linea);
			write ('Ingrese cantidad de nucleos: ');
			readln (m.nucleos);
			write ('Ingrese velocidad: ');
			readln (m.veloc);
			write ('Ingrese tamano de transitores: ');
			readln (m.tamano);
			writeln('==================================');
		end;

	var
		m:micro; marcaactual, marcaTmax, marcaTmaxdos:string; 
		cantt, cantr, cantTtotal, cantTtotaldos: integer;
	begin
		cantTtotal:=0; {marcas con mayor cantidad de transistores de 14mm}
		cantr:=0; {2 o +nucleos de intel o amd con velocidades >=2}
		leer (m);

		while (m.nucleos<>0) do begin
			marcaactual:=m.marca;
			cantt:=0; {transistores de 14nm por marca}
			while (m.marca=marcaactual) and (m.nucleos<>0) do begin
				if (((m.marca='Intel') or (m.marca='AMD')) and (m.veloc>=2)) then {2 o + cores de Intel o AMD, con velocidades>=2}
					cantr:=cantr+1;

				if (m.tamano=14) then {dos marcas con mayor cantidad de procesadores con transistores de 14 nm}
					cantt:=cantt+1;

				If (m.nucleos>2) and (m.tamano<=22) then {Marca y línea de los micros>2cores y transistores<=22 nm}
					writeln ('Marca de micro con mas de 2 cores y transistores de, a lo sumo 22nm: ', m.marca,' linea: ',  m.linea);

				if (cantTtotal<cantt) then begin {dos marcas con mayor cantidad de procesadores con transistores de 14 nm}
					marcaTmaxdos:=marcaTmax;
					marcaTmax:=m.marca;
					cantTtotaldos:=cantTtotal;
					cantTtotal:=cantt;
				end {end del if}
				else
					if (cantt>cantTtotaldos) then begin
						marcaTmaxdos:=m.marca;
						cantTtotaldos:=cantt;
					end;

				leer(m);
			end; {end del segundo mientras}

		end; {end del primer mientras}

		writeln ('La marca con mas cantidad de procesadores con transistores de 14 nm es: ', marcaTmax, ' y la segunda es: ', marcaTmaxdos);
	end.
