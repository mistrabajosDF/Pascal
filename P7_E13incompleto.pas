Program P7E13;
//se carga informacion de usuarios y se informa:
//nombre de usuario y cantidad de días desde el último acceso de todos los usuarios 
//emails de los dos usuarios que hace más tiempo que no ingresan
	type
		user=record
			mail:string;
			rol:integer; //su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), 
			revista:string;
			dias:integer;
		end;

		lista = ^nodo;

		nodo=record
			dato:user;
			sig:lista;
		end;

	procedure NodoOrd(var l, ult : lista; u:user);
		var
			aux : lista;
		begin
			new(aux);
			aux^.dato:=u;
			aux^.sig:=nil;
			If (l=nil) then
				L:=aux
			else
				ult^.sig:=aux;
			ult:=aux;
		end;

	Procedure leerdispo (var u:user);
		begin
			write('Ingrese mail: ');
			readln(u.mail);
			write('Ingrese rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector): ');
			readln(u.rol);
			write('Ingrese revista: ');
			readln(u.revista);
			write('Ingrese dias desde ultimo acceso: ');
			readln(u.dias);
			writeln('=========================================================');
		end;

	Procedure cargarlista (var l, ult:lista);
		var
			u: user; i:integer;
		begin
			for i:=1 to 3 do begin //deberia ser 3600
				leerdispo (u);
				NodoOrd (l, ult, u);
			end;
		end;

	Procedure imprimirlista (p:lista);
		begin
			while (p<> nil) do begin
				writeln ('Mail: ', p^.dato.mail);
				writeln ('Rol: ', p^.dato.rol);
				writeln ('Revista: ', p^.dato.revista);
				writeln ('Dias: ', p^.dato.dias);
				p:=p^.sig;
				writeln('==================================');
			end;
		end;

	Procedure mastiempo (p:lista); //mails de los 2 usuarios que hace más tiempo que no ingresan al portal.
		var
			tiem1, tiem2:integer; mail1, mail2:string;
		begin
			tiem1:=0;
			tiem2:=0;
			while (p<>nil) do begin
				if (p^.dato.dias>tiem1) then begin
					tiem2:=tiem1;
					mail2:=mail1;

					tiem1:=p^.dato.dias;
					mail1:=p^.dato.mail;
				end
				else
					if (p^.dato.dias>tiem2) then begin
						tiem2:=p^.dato.dias;
						mail2:=p^.dato.mail;
					end;
				p:=p^.sig;
			end;
			writeln ('Los mails de los 2 usuarios que llevan mas tiempo sin entrar son: ', mail1, ' y ', mail2);
		end;

	var
		l, ult:lista;
	begin
		l:= nil;
		cargarlista (l, ult);
		imprimirlista (l);
		mastiempo (l);
	end.
