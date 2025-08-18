Program p5e8;
//Lee y almacena salarios (a lo sumo 300) o al ingresar salario 0
//Luego se incrementa el salario en un 15%, y se informa el sueldo promedio

	const
		dimF=10; {deberia ser 300}
	type
		numeros=array [1..dimF] of real;

	Procedure Cargar (var comp:numeros; var dimL:integer); {lee salarios hasta 0 (que no debe procesarse) o max 300}
		var
			num:integer;
		begin
			dimL:=0; {cant de datos que se ingresan}
			writeln ('Ingrese numero: ');
			readln (num); {nº que se ingresan}
			while (dimL<dimF) and (num<>0) do begin {Hasta 10 lugares, o que se ingrese -1} //Que dimension se deberia poner aca si no especifica?
				dimL:=dimL+1;
				comp [dimL]:=num; {asignacion de nº en posicion (orden inverso)}
				writeln ('Ingrese numero: ');
				readln (num); {nº que se ingresan}
			end;
		end;

	Procedure quincemas (var comp:numeros; dimL:integer); //Salario +15%. Recibe un valor real X, el vector de valores reales, su dimL y retorna el mismo vector en el cual cada elemento fue multiplicado por el valor X.
		var
			i:integer;
		begin
			for i:=1 to dimL do
				comp [i]:=comp [i]*1.15;
		end;

	Procedure promedio (comp:numeros; dimL:integer); {muestre el sueldo promedio de los empleados}
		var
			suma, promedio:real; i:integer;
		begin
			suma:=0;
			for i:=1 to dimL do
				suma:=suma+comp[i];
			promedio:=suma/dimL;
			writeln ('=================================================');
			writeln ('El promedio de todos los sueldos es: ', promedio:4:2);
			writeln ('=================================================');
		end;

	//PROGRAMA PRINCIPAL
	var
		comp:numeros; dimL:integer;
	begin
		Cargar (comp, dimL);
		
		quincemas (comp, dimL);
		promedio (comp, dimL);
	end.
