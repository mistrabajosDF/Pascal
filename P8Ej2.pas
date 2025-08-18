Program mau;

type
cliente=record
codigoc:integer;
dni:longint;
apellido, nombre:string;
codigop:1..6;
monto:real;
end;

lista = ^nodo;

nodo=record
dato:cliente;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; c:cliente);
var
aux : lista;
begin
new(aux);
aux^.dato:= c;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leercliente (var c:cliente);
begin
writeln('Ingrese codigo de cliente: ');
readln(c.codigoc);
if (c.codigoc<>1122) then begin
writeln('Ingrese dni: ');
readln(c.dni);
writeln('Ingrese nombre: ');
readln(c.nombre);
writeln('Ingrese apellido: ');
readln(c.apellido);
writeln('Ingrese codigo poliza: ');
readln(c.codigop);
writeln('Ingrese monto mensual: ');
readln(c.monto);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
c: cliente;
begin
leercliente (c);
while (c.codigoc<>1122) do begin
NodoOrd (l, ult, c);
leercliente (c);
end;
end;

Procedure imprimir (p:lista); //DNI, apellido, nombre y el monto total(monto básico + monto adicional)
var
total:real;
begin
while (p<> nil) do begin
case p^.dato.codigop of
1:total:= p^.dato.monto + 100;
2:total:= p^.dato.monto + 200;
3:total:= p^.dato.monto + 300;
4:total:= p^.dato.monto + 400;
5:total:= p^.dato.monto + 500;
6:total:= p^.dato.monto + 600;
end;
writeln ('Dni del cliente: ', p^.dato.dni);
writeln ('Apellido del cliente: ', p^.dato.apellido);
writeln ('Nombre del cliente: ', p^.dato.nombre);
writeln ('Monto total: ', total:3:2);
p:=p^.sig;
total:=0;
end;
end;

Procedure dninueve (p:lista); //apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9
var
cant, num, nueve:integer;

begin
while (p<> nil) do begin
cant:=0;
num:=p^.dato.dni;
	while (num<>0) do begin
		nueve:=num mod 10;
		if (nueve=9) then
			cant:=cant+1;
		num:=num div 10;
	end;
	if (cant>=2) then begin
		writeln ('Dni del cliente con 9: ', p^.dato.dni);
		writeln ('Apellido del cliente con 9: ', p^.dato.apellido);
	end;
p:=p^.sig;
end;
end;

procedure eliminar (var p:lista; valore:integer); // reciba un código de cliente, lo busque (seguro existe) y lo elimine
var
act, ant:lista;
begin
act:=p;
while (act<>nil) and (act^.dato.codigoc<>valore) do begin
ant:=act;
act:=act^.sig;
end;
if (act<>nil) then
if (act=p) then begin
p:=p^.sig;
dispose (act)
end
else begin
ant^.sig:=act^.sig;
dispose (act);
end;
end;

var
l, ult:lista; valore:integer;
begin
l:= nil;
cargarlista (l, ult);
imprimir (l);
dninueve (l);
writeln ('Ingrese codigo a eliminar:');
readln (valore);
eliminar(l, valore);
imprimir(l);
end.
