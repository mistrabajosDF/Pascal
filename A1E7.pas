program novelas;
//Crear un archivo binario a partir de “novelas.txt”
//Abrir el archivo binario, permitir agregar novela y modificar una existente. 
//Las búsquedas se realizan por código de novela.
type
	novela=record
		cod:integer;
		genero:string;
		precio:real;
		nombre:string;
	end;
	
	archivo7=file of novela;

var
	novelas: archivo7;
	nombreF:string;
	nov:novela;
		
	nombre2:string;
	arctext: Text;
	//////////////////////////////////////////
	Procedure cargar;
	begin
	nombre2:='novelas.txt'; ////ESTE ARCHIVO TIENE QUE ESTAR EN LA MISMA CARPETA QUE ESTE .PAS
	Assign(arctext, nombre2); 
	Reset(arctext); {abre archivo de texto con datos}
	writeln ('Ingrese nombre del archivo bin a crear:');
	readln (nombreF);
	assign (novelas, nombreF);
	rewrite(novelas); {crea nuevo archivo binario}
	while (not eof(arctext)) do begin
		With nov do begin
			ReadLn(arctext, cod, precio, genero);
			readln(arctext, nombre); {lectura de archivo de texto}
		end;
		Write(novelas, nov); {escribe binario}

    end;
	Close(novelas); Close(arctext); {cierra los dos archivos}
	end;
	
/////////////////////////////////////////////////////////////
	procedure agregar;	
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (novelas, nombreF);
	reset (novelas);
	while not eof (novelas) do
		read (novelas, nov);
	
	writeln ('Ingrese nombre, para terminar, ingrese fin:');
	readln (nov.nombre);
	while (nov.nombre<>'fin') do begin
		writeln ('Ingrese codigo:');
		readln (nov.nombre);
		writeln ('Ingrese genero:');
		readln (nov.genero);
		writeln ('Ingrese precio:');
		readln (nov.precio);
		
		write (novelas, nov);
		
		writeln ('Ingrese nombre:');
		readln (nov.nombre);
	end;	
	close (novelas);
	end;
////////////////////////////////////////////////////////////////
procedure modificar;
	var
		codbus, selec:integer; stop:boolean;
	begin
	writeln ('Ingrese nombre del archivo:');
	readln (nombreF);
	assign (novelas, nombreF);
	reset (novelas);
	
	writeln ('Ingrese codigo de novela a modificar: ');
	readln (codbus);
	
	stop:=false;
	while not eof (novelas) and (stop=false) do begin
		read (novelas, nov);
		if (nov.cod=codbus) then begin
			stop:=true;
			writeln ('Para modificar cada campo ingrese su numero: Nombre=1, Precio=2, Genero=3.');
			readln (selec);
			if (selec=1) then begin
				writeln ('Ingrese nombre: ');
				readln (nov.nombre);
			end
			else begin
				if (selec=2) then begin
					writeln ('Ingrese precio: ');
					readln (nov.precio); 
				end
				else
					if (selec=3) then begin
						writeln ('Ingrese genero: ');
						readln (nov.genero);
					end;	
			end;
			seek (novelas, filepos (novelas)-1);
			write (novelas, nov);
			writeln (' ');
			writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
			writeln (' ');
		end;	
	end;
	close (novelas);
end;

////////////////////////////////////////////////////////////////
var
dato:integer;
begin
	dato:=15;
	while (dato<>0) do begin
		writeln ('PARA SALIR INGRESE 0');
		writeln ('Para crear el archivo desde txt, ingrese 1');
		writeln ('Para agregar una novela, ingrese 2');
		writeln ('Para modificar una novela existente, ingrese 3');
		readln (dato);
		writeln (' ');
		writeln ('-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-');
		writeln (' ');

		case dato of
			1: cargar;
			2: agregar;
			3: modificar;
		end;
	end;
end.
