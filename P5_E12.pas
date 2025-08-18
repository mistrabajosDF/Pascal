Program p5_e12;
//leer y guardar info de equipos con ubuntu. termina de cargar con la version 4.10. luego informar:
//cantidad de computadoras que utilizan las versiones 18.04 o 16.04
//promedio de cuentas de usuario por computadora
//versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados
	const
		fisica=3;
	type
		ubuntu=record
			version:string;
			paquetes:integer;
			cuentas:integer;
		end;

		Vubuntu=array [1..fisica] of ubuntu;

	Procedure cargar (var v:Vubuntu; var dimL:integer);
		var
			version2:string; paquetes2, cuentas2:integer;
		begin
			diml:=0;
			write ('Ingrese version: ');
			readln (version2);
			write ('Ingrese cantidad de paquetes: ');
			readln (paquetes2);
			write ('Ingrese cantidad de cuentas: ');
			readln (cuentas2);
			writeln('===========================================================================');
			while (dimL<fisica) and (version2<>'4.10') do begin
				dimL:=dimL+1;
				v[dimL].version:=version2;
				v[dimL].paquetes:=paquetes2;
				v[dimL].cuentas:=cuentas2;
				write ('Ingrese version: ');
				readln (version2);
				write ('Ingrese cantidad de paquetes: ');
				readln (paquetes2);
				write ('Ingrese cantidad de cuentas: ');
				readln (cuentas2);
				writeln('===========================================================================');
			end;	
		end;

	Procedure promedio (v:Vubuntu; dimL:integer); //promedio de cuentas de usuario por computadora
		var
			promedio, suma:real; i:integer;
		begin
			suma:=0;
			for i:=1 to dimL do
				suma:=suma+v[i].cuentas;
			promedio:=suma/dimL;
			writeln ('El promedio de cuentas por compu es: ', promedio:8:2);
		end;

	Procedure maspaquetes (v:Vubuntu); //- versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados
		var
			i, maspaquetes:integer; masversion:string;
		begin
			maspaquetes:=-1;
			for i:=1 to fisica do begin
				if (v[i].paquetes>maspaquetes) then begin
					maspaquetes:=v[i].paquetes;
					masversion:=v[i].version;
				end;
			end;
			writeln('===========================================================================');
			writeln ('La version de Ubuntu en la compu con mas paquetes instalados es: ', masversion);
		end;

	Procedure cantversion (v:Vubuntu; dimL:integer); //- cantidad de computadoras que utilizan las versiones 18.04 o 16.04
		var
			cant, i:integer;
		begin
			cant:=0;
			for i:=1 to dimL do begin
				if (v[i].version='18.04') or (v[i].version='16.04') then
					cant:=cant+1;
			end;
		end;

	var
		v:Vubuntu; dimL:integer;
	begin
		cargar (v, dimL);
		promedio (v, dimL);
		maspaquetes (v);
		cantversion (v, dimL);
	end.
