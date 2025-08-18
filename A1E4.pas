Program empleadoss;
//Agregar al menú del programa anterior:
//Añadir empleados, modificar edad de empleados, exportar el contenido 
//del archivo a un txt “todos_empleados.txt”.
//Exportar a un txt: “faltaDNIEmpleado.txt”, los empleados
//que no tengan cargado el DNI (DNI en 00).
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
	
	nombre2:string;
	arctext: Text;
	
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
	
	procedure sumaremple;		//Añadir una o más empleados al final del archivo con sus datos ingresados por teclado.
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	reset (empleados);
	while not eof (empleados) do
		read (empleados, emp);
	
	writeln ('Ingrese apellido, para terminar, ingrese fin:');
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
	///////////////////////////////////////////////////////////////////
	procedure modedad;			 //Modificar edad a una o más empleados.
	var
		numbus:integer;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (empleados, nombreF);
	reset (empleados);
	
	writeln ('Ingrese numero de empleado a modificar la edad: ');
	readln (numbus);

	while not eof (empleados) do begin
		read (empleados, emp);
		if (emp.num=numbus) then begin
			writeln ('Ingrese edad actualizada del empleado: ', emp.num);
			readln (emp.edad);
			seek (empleados, filepos (empleados)-1);
			write (empleados, emp);
			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (empleados);
	end;

	procedure exportar; //Exportar el contenido del archivo a un archivo de texto llamado “todos_empleados.txt”.
	begin
		writeln ('Ingrese nombre fisico del archivo existente:');
		readln (nombreF);
		assign (empleados, nombreF);
        reset(empleados); //abre archivo binario
        writeln ('Ingrese nombre fisico del archivo de texto a crear: ');
        readln (nombre2);
        assign (arctext, nombre2);
		Rewrite(arctext); //crea archivo de texto
		while (not eof(empleados)) do begin
			read(empleados, emp); //lee del arch binario
      //with emp do 
      //WriteLn(codProv:5, codLoc:5, nroMesa:5, cantVotos:5, desc:5); {escribe en pantalla el registro}
			with emp do 
			writeLn(arctext,' ',num,' ',apellido,' ',nombre,' ',edad,' ',dni); //escribe en el archivo texto los campos separados por el carácter blanco
		end;
  close(empleados); 
  close(arctext);
  end;
	
	procedure expdni; //Exportar a un archivo de texto llamado: “faltaDNIEmpleado.txt”, los empleados que no tengan cargado el DNI (DNI en 00)
	begin
		writeln ('Ingrese nombre fisico del archivo existente:');
		readln (nombreF);
		assign (empleados, nombreF);
        reset(empleados); 
        writeln ('Ingrese nombre fisico del archivo de texto a crear: ');
        readln (nombre2);
        assign (arctext, nombre2);
		Rewrite(arctext); 
		while (not eof(empleados)) do begin
			read(empleados, emp);
			if (emp.dni=00) then 
				with emp do 
					writeLn(arctext,' ',num,' ',apellido,' ',nombre,' ',edad,' ',dni); {escribe en el archivo texto los campos separados por el carácter blanco}
  end;
  close(empleados); 
  close(arctext)
	end;

////////////////////////////////////////////////////////////////////////////

var
dato:integer;
begin
	dato:=15;
	while (dato<>0) do begin
		writeln ('PARA SALIR INGRESE 0');
		writeln ('Para crear el archivo ingrese 1');
		writeln ('Para abrir el archivo y buscar empleados con un determinado nombre o apellido ingrese 2');
		writeln ('Para abrir el archivo e impirmir empleados uno por linea ingrese 3');
		writeln ('Para abrir el archivo y buscar empleados mayores a 70 ingrese 4');
		writeln ('Para a?adir mas empleados ingrese 5');
		writeln ('Para modificar edad ingrese 6');
		writeln ('Para exportar el contenido a un archivo de texto ingrese 7');
		writeln ('Para exportar los empleados que no tengan dni (DNI=00) ingrese 8');
		readln (dato);
		writeln (' ');
		writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
		writeln (' ');
		case dato of
			1:carga;
			2:imprimirsi;
			3:imprimirtodo;
			4:viejos;
			5:sumaremple;
			6:modedad;
			7:exportar;
			8:expdni;
		end;
	end;
end.
