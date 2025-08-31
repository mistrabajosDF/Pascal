{El administrador de un edificio de oficinas cuenta con la información del pago de
las expensas.
a. Genere un vector, sin orden, con a lo sumo 300 oficinas con código de identificación, 
DNI del propietario y expensa. La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.}

Program ejercicio1;
	 type
		 oficina=record
		 codi:integer;
		 dni:longint;
		 valor:integer;
	 end;
	 
	 Voficinas= array [1..300] of oficina;
 
Procedure cargar (var v:Voficinas; var dimL:integer);
	var
		cod:integer;
	begin
		diml:=0;
		writeln ('Ingrese codigo de identificacion: ');
		readln (cod);
		while (dimL<300) and (cod<>0) do begin
			dimL:=dimL+1;
			v[dimL].codi:=cod;
			writeln ('Ingrese DNI: ');
			readln (v[dimL].dni);
			writeln ('Ingrese valor de la expensa: ');
			readln (v[dimL].valor);
			writeln ('Ingrese codigo de identificacion: ');
			readln (cod);
		end;
end;

Procedure insercion (var v:voficinas; diml:integer);
	var
		actual:oficina; i, j:integer;
	begin
		for i:=2 to diml do begin
			actual:=v[i];
			j:=i-1;
			while ((j>0) and (v[j].codi>actual.codi)) do begin
				v [j+1]:=v[j];
				j:=j-1;
			end;
			v[j+1]:=actual;
		end;
	end;

Procedure imprimir (v:voficinas; diml:integer);
	var
		i:integer;
	begin
		Writeln ('=======Oficinas=======');
		for i:=1 to dimL do begin
			Writeln ('Codigo: ', v[i].codi);
			Writeln ('DNI: ', v[i].dni);
			Writeln ('Valor: ', v[i].valor);
			Writeln ('==============');
		end;
end;

var
	v:voficinas; diml:integer;
begin
	cargar (v, diml);
	insercion (v, diml);
	imprimir (v, diml);
end.
