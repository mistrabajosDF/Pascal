Program empleadoss;
//Crear un archivo de empleados y completarlo con datos ingresados desde teclado. 
//(número de empleado, apellido, nombre, edad y DNI).
//Finalizacion de carga: ‘fin’ como apellido.
//Abrir el archivo y Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado;
//los empleados de a uno por línea y los mayores de 70 años
type
	empleado=record
		num: integer;
		apellido: string;
		nombre: string;
		edad: integer;
		dni: longint;
	end;
	archivo2=file of empleado;
var
	empleados:archivo2;
	
	nombreF: string;
	emp: empleado;
	
	//CARGA DE ARCHIVO
	//a. Crear un archivo de registros de empleados
	procedure carga;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	rewrite (empleados);
	
	writeln ('Ingrese apellido:');
	readln (emp.apellido);
	while (emp.apellido<>'fin') do begin
		writeln ('Ingrese nombre:');
		readln (emp.nombre);
		writeln ('Ingrese edad:');
		readln (emp.edad);
		writeln ('Ingrese dni:');
		readln (emp.dni);
		writeln ('Ingrese numero de empleado:');
		readln (emp.num);
		
		write (empleados, emp);
		
		writeln ('Ingrese apellido:');
		readln (emp.apellido);
	end;	
	close (empleados);
	end;
	//FIN DE CARGA
	
	//i. Listar en pantalla los datos de empleados que tengan un nombre o apellido determinado.
	Procedure imprimirsi;
	var
	nom1, ap1:string;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	reset (empleados);
	writeln ('Ingrese apellido a buscar:');
	readln (ap1);
	writeln ('ingrese nombre a buscar:');
	readln (nom1);
	writeln (' ');
	writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
	writeln (' ');
	while not eof (empleados) do begin
		read (empleados, emp);
		if (emp.nombre=nom1) or (emp.apellido=ap1) then begin
			writeln ('Apellido: ', emp.apellido);
			writeln ('Nombre: ', emp.nombre);
			writeln ('DNI: ', emp.dni);
			writeln ('Edad: ', emp.edad);
			writeln ('Numero de empleado: ', emp.num);	
			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (empleados);
	end;
	
	//ii. Listar en pantalla los empleados de a uno por línea.
	procedure imprimirtodo;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	reset (empleados);
	writeln (' ');
	writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
	writeln (' ');
	while not eof (empleados) do begin
		read (empleados, emp);
		writeln ('Apellido: ', emp.apellido);
		writeln ('Nombre: ', emp.nombre);
		writeln ('DNI: ', emp.dni);
		writeln ('Edad: ', emp.edad);
		writeln ('Numero de empleado: ', emp.num);	
		end;	
		writeln (' ');
		writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
		writeln (' ');
	close (empleados);
	end;
	
	//iii. Listar en pantalla empleados mayores de 70 años, próximos a jubilarse.	
	procedure viejos;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	reset (empleados);
	writeln (' ');
	writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
	writeln (' ');
	while not eof (empleados) do begin
		read (empleados, emp);
		if (emp.edad>70) then begin
			writeln ('Apellido: ', emp.apellido);
			writeln ('Nombre: ', emp.nombre);
			writeln ('DNI: ', emp.dni);
			writeln ('Edad: ', emp.edad);
			writeln ('Numero de empleado: ', emp.num);
			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (empleados);
	end;

var
dato:integer;
begin
	dato:=5;
	while (dato<>0) do begin
		writeln ('PARA SALIR INGRESE 0');
		writeln ('Para crear el archivo ingrese 1');
		writeln ('Para abrir el archivo y buscar empleados con un determinado nombre o apellido ingrese 2');
		writeln ('Para abrir el archivo e impirmir empleados uno por linea ingrese 3');
		writeln ('Para abrir el archivo y buscar empleados mayores a 70 ingrese 4');
		readln (dato);
		writeln (' ');
		writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
		writeln (' ');
		case dato of
			1:carga;
			2:imprimirsi;
			3:imprimirtodo;
			4:viejos;
		end;
	end;
end.
