{Leer nº y, mediante un procedimiento recursivo, escribirlos
en binario de un número decimal. El programa termina cuando el usuario
ingresa el número 0 (cero)}

program e7;

procedure conversor (num:integer);
begin
if (num<=1) then
	write ('El numero ingresado en binario es: ', num) //escribe primer digito cuando "achico" del todo el numero
else begin
	conversor (num div 2);
	write (num mod 2); //escribe los demas digitos con los procesos recursivos
end;
end;

var
num:integer;
begin
writeln ('Ingrese numero en decimal: ');
read (num);
while (num <> 0) do begin
	conversor (num);
	writeln (' ');
	writeln ('Ingrese numero en decimal: ');
	read(num);
end;
end.







