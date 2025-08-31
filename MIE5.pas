{a. módulo que genere un vector de 20 números enteros.
b. módulo recursivo que devuelva el máximo valor del vector.
c. módulo recursivo que devuelva la suma de los valores contenidos en el vector.}

program e5;
	type
		vector=array [1..5] of integer; //deberian ser 20

procedure carga (var v:vector; var diml:integer);
	var
		i, num:integer;
	begin
		for i:=1 to 5 do begin 
			writeln ('Ingrese numero: ');
			readln (num);
			v[i]:=num;
			diml:=diml+1;
		end;
end;

procedure maximo (v:vector; diml:integer; var max: integer);
	begin
		if (diml>0) then begin
			if (v[diml]>max) then
				max:=v[diml];
			maximo (v, diml-1, max);
		end;
	end;

Function sumar (v:vector; diml:integer):integer;
	begin
	if (diml=0) then
	  sumar:=0
	else
	  sumar:=v[diml]+sumar(v, diml-1);
end;


//PROGRAMA PRINCIPAL
var
	v:vector; diml, max: integer;
begin
	carga (v, diml);
	max:=0;
	maximo(v, diml, max);
	writeln ('El numero maximo es: ', max);
	writeln ('El resultado de la suma de los elem es: ', sumar (v, diml));
end.
