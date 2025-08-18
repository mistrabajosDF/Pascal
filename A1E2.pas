program procesarnumeros;

// Realizar un algoritmo, que utilizando el archivo creados en el ejercicio 1, 
//informe cantidad de números menores a 1500 y el promedio. 
//El nombre del archivo a procesar debe ser proporcionado por el usuario. 
//Además, el algoritmo deberá listar el contenido del archivo en pantalla.

type
	archivoZ=file of integer;
var
	enteritos:archivoZ;
	nombreF: string;
	num: integer;
	prom: real;
	cant, acum:integer;
begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (enteritos, nombreF);
	reset (enteritos);
	cant:=0;
	acum:=0;
	while not eof (enteritos) do begin
		read (enteritos, num);
		if (num<1500) then
			cant:=cant+1;
		acum:=acum+num;
		writeln ('Numero en el archivo: ', num);
	end;
	prom:=acum/FileSize(enteritos);
	writeln ('El promedio de los valores es: ', prom:3:2);
	writeln ('La cantidad de numeros menores a 1500 es: ', cant);
	close (enteritos);
end.
	
	
		
	


