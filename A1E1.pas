Program numeros;

//Cree un archivo de enteros no ordenados y permita incorporar datos.
//Los números son ingresados desde teclado. El nombre del archivo debe ser proporcionado 
//por el usuario. La carga finaliza con el numero 30000, que no debe incorporarse.

type
	archivoZ=file of integer;
var
	enteritos:archivoZ;
	nombreF: string;
	num: integer;
begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (enteritos, nombreF);
	rewrite (enteritos);
	writeln ('Ingrese numero:');
	readln (num);
	while (num<>30000) do begin
		write (enteritos, num);
		writeln ('Ingrese numero:');
		readln (num);
	end;
	close (enteritos);
end.
	
