program celulares;
//Crear un archivo de celulares (código de celular, el nombre,
//descripción, marca, precio, stock mínimo y el stock) y cargarlo desde “celulares.txt”. Los registros
//Listar celulares que tengan un stock menor al mínimo.
//Listar los celulares cuya descripción contenga un string dado.
//Exportar el archivo creado en el inciso a) a un archivo de texto denominado “celular.txt”
type
	celu=record
		nombreymarca: string;
		cod: integer;
		descr: string;
		precio: real;
		stockmin:integer;
		stockdisp: integer;
	end;
	archivo5=file of celu;
var
	celus:archivo5;
	
	nombreF: string;
	cel: celu;
	
	nombre2:string;
	arctext: Text;

//a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
//ingresados desde un archivo de texto denominado “celulares.txt”.
	Procedure cargar;
	begin
	nombre2:='celulares.txt'; ////ESTE ARCHIVO TIENE QUE ESTAR EN LA MISMA CARPETA QUE ESTE .PAS
	Assign(arctext, nombre2); 
	Reset(arctext); {abre archivo de texto con datos}
	writeln ('Ingrese nombre del archivo bin a crear:');
	readln (nombreF);
	assign (celus, nombreF);
	rewrite(celus); {crea nuevo archivo binario}
	while (not eof(arctext)) do begin
		With cel do begin
			ReadLn(arctext, cod, precio, nombreymarca);
			readln(arctext, stockmin, stockdisp, descr); {lectura de archivo de texto}
		end;
		Write(celus, cel); {escribe binario}
    end;
	Close(celus); Close(arctext); {cierra los dos archivos}
	end;
	
	
	//b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al stock mínimo.
	procedure stock;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (celus, nombreF);
	reset (celus);
	writeln (' ');
	writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
	writeln (' ');
	while not eof (celus) do begin
		read (celus, cel);
		if (cel.stockmin>cel.stockdisp) then begin
			writeln ('Nombre y marca: ', cel.nombreymarca);
			writeln ('Codigo: ', cel.cod);
			writeln ('Descripcion: ', cel.descr);
			writeln ('Precio: ', cel.precio:5:2);
			writeln ('Stock minimo: ', cel.stockmin);
			writeln ('Stock disponible: ', cel.stockdisp);			

			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (celus);
	end;

//c. Listar en pantalla los celulares del archivo cuya descripción contenga una cadena de caracteres proporcionada por el usuario.
Procedure imprdescrip;
	var
	cadbus:string;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (celus, nombreF);
	reset (celus);
	writeln ('Ingrese descripcion a buscar con un espacio adelante. Por que? No hay porque:');
	readln (cadbus);
	writeln (' ');
	writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
	writeln (' ');
	while not eof (celus) do begin
		read (celus, cel);
		if (cel.descr=cadbus) then begin
			writeln ('Nombre y marca: ', cel.nombreymarca);
			writeln ('Codigo: ', cel.cod);
			writeln ('Descripcion: ', cel.descr);
			writeln ('Precio: ', cel.precio:5:2);
			writeln ('Stock minimo: ', cel.stockmin);
			writeln ('Stock disponible: ', cel.stockdisp);
			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (celus);
	end;


// Exportar el archivo creado en el inciso a) a un archivo de texto denominado
//“celular.txt” con todos los celulares del mismo.

procedure exportar;
begin
		writeln ('Ingrese nombre fisico del archivo existente:');
		readln (nombreF);
		assign (celus, nombreF);
        reset(celus); //abre archivo binario
        writeln ('Ingrese nombre fisico del archivo de texto a crear: ');
        readln (nombre2);
        assign (arctext, nombre2);
		Rewrite(arctext); //crea archivo de texto
		while (not eof(celus)) do begin
			read(celus, cel); //lee del arch binario
			with cel do 
			writeLn(arctext,' ',nombreymarca,' ',cod,' ',descr,' ',precio:5:2,' ',stockmin,' ', stockdisp); //escribe en el archivo texto los campos separados por el carácter blanco
		end;
  close(celus); 
  close(arctext);
end;

/////////////////////////////////////////////////////////////////////////////////////////7
var
dato:integer;
begin
	dato:=15;
	while (dato<>0) do begin
		writeln ('PARA SALIR INGRESE 0');
		writeln ('Para crear el archivo desde txt, ingrese 1');
		writeln ('Para imprimir los celus que tienen stock menor al minimo, ingrese 2');
		writeln ('Para impirmir celus con una descripcion dada, ingrese 3');
		writeln ('Para exportar el archivo creado en el inciso (a) a texto, ingrese 4');
		readln (dato);
		writeln (' ');
		writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
		writeln (' ');

		case dato of
			1: cargar;
			2: stock;
			3: imprdescrip;
			4: exportar;
		end;
	end;
end.
