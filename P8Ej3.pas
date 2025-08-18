Program mau;

type
viajes=record
num,codigo:integer;
origen, destino:string;
km:integer;
end;

lista = ^nodo;

nodo=record
dato:viajes;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; v:viajes);
var
aux : lista;
begin
new(aux);
aux^.dato:= v;
aux^.sig:=nil;
If (l=nil) then
L:=aux
else
ult^.sig:=aux;
ult:=aux;
end;

Procedure leerviajes (var v:viajes);
begin
writeln('Ingrese numero de viaje: ');
readln(v.num);
if (v.num<>0) then begin
writeln('Ingrese codigo de auto: ');
readln(v.codigo);
writeln('Ingrese dirreccion origen: ');
readln(v.origen);
writeln('Ingrese direccion de destino: ');
readln(v.destino);
writeln('Ingrese distancia en km: ');
readln(v.km);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
v: viajes;
begin
leerviajes (v);
while (v.num<>0) do begin
NodoOrd (l, ult, v);
leerviajes (v);
end;
end;

procedure maskm (p:lista);//Informar los dos códigos de auto que más kilómetros recorrieron
var
km1, km2, cod1, cod2:integer;
begin
km1:=0;
km2:=0;
while (p<> nil) do begin
if (p^.dato.km>km1) then begin
km2:=km1;
cod2:=cod1;
cod1:=p^.dato.codigo;
km1:=p^.dato.km;
end
else
if (p^.dato.km>km2) then begin
km2:=p^.dato.km;
cod2:=p^.dato.codigo;
end;
p:=p^.sig;
end;
end;

Procedure agregarviaje (p:lista; var v:viajes);
begin
with v do begin
num:=p^.dato.num;
codigo:=p^.dato.codigo;
origen:=p^.dato.origen;
destino:=p^.dato.destino;
km:=p^.dato.km;
end;
end;

Procedure insertarordenado (var c:lista; v:viajes);
var
nue, act, ant:lista;
begin
new (nue);
nue^.dato:=v;
act:=c;
ant:=c;
while (act<>nil) and (v.num>c^.dato.num) do begin
ant:=act;
act:=act^.sig;
end;
if (act=ant) then
c:=nue
else
ant^.sig:=nue;
nue^.sig:=act;
end;

Procedure listanue (l:lista; var c:lista);
var
v:viajes;
begin
while (l<>nil) do begin
if (l^.dato.km>5) then
agregarviaje (l, v);
insertarordenado (c, v);
l:=l^.sig;
end;
end;

Procedure imprimir (l:lista);
begin
while (l<>nil) do begin
Writeln ('Numero: ', l^.dato.num);
Writeln ('Codigo: ', l^.dato.codigo);
Writeln ('Origen: ', l^.dato.origen);
Writeln ('Destino: ', l^.dato.destino);
Writeln ('KM: ', l^.dato.km);
l:=l^.sig;
end;
end;

var
l, ult, cinco:lista;
begin
l:= nil;
cinco:=nil;
cargarlista (l, ult);
writeln ('Lista completa.');
imprimir (l);
maskm (l);
listanue (l, cinco);
writeln ('Subslita.');
imprimir (cinco);
end.
