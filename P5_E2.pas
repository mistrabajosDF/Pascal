program Vectores;
	const
		cant_datos = 10; {deberia ser 150}
	type
		vdatos = array [1..cant_datos] of real;

	procedure cargarVector (var v:vdatos; var dimL:integer);
		var
			num:real;
		begin
			dimL:=0; {cant de datos que se ingresan}
			writeln ('Ingrese numero: ');
			readln (num); {nº que se ingresan}
			while (dimL<cant_datos) and (num<>0) do begin {Hasta que se llena, o se ingrese 0}
				dimL:=dimL+1;
				v [dimL]:=num; {asignacion de nº en posicion (orden inverso)}
				writeln ('Ingrese numero: ');
				readln (num); {nº que se ingresan}
			end;
		end ;

	procedure modificarVectorySumar (var v:vdatos; dimL : integer; n: real; var suma: real);
		//​debe devolver el vector con todos sus elementos incrementados con el valor n y la suma de todos los elementos
		var
			i:integer;
		begin
			for i:=1 to dimL do 
				v [i]:=v [i]+n;
			for i:=1 to dimL do 
				suma:=suma+v [i];
		end ;

	//programa principal

	var
		datos:vdatos; dim:integer; num, suma: real;
	begin
		dim := 0;
		suma:= 0;
		cargarVector(datos, dim);
		writeln ('Ingrese un valor a sumar: ');
		readln(num);
		modificarVectorySumar(datos, dim, num, suma);
		writeln('La suma de los valores es: ', suma:4:2);
		writeln('Se procesaron: ',dim, ' numeros');
	end.
