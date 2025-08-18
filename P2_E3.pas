program prac2ejer3;
//A partir de notas y alumnos ingresados informa cuantos aprobaron
//(Nota mayor o igual a 8) y cuantos sacaron 7. Se termina el ingreso
//con el nombre "Zidane"
	var
		nombre:string; nota:real; siete, aprobado: integer;
	begin
		aprobado:=0;
		siete:=0;
		repeat
			write ('Ingrese nombre:' );
			readln (nombre);
			write ('Ingrese nota:' );
			readln (nota);
			If (nota>=8)then
				aprobado:=aprobado+1;
			If (nota=7) then
				siete:=siete+1;
		until (nombre='Zidane');
		writeln('');
		writeln ('=====================================');
		writeln ('Cantidad de alumnos aprobados: ', aprobado);
		writeln ('Cantidad de alumnos con 7: ', siete);
		writeln ('=====================================');
	end.
