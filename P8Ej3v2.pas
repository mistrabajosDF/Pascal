Program mau;

type
viajes=record
codigo, num:integer;
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
writeln('Ingrese codigo de auto: ');
readln(v.codigo);
if (v.codigo<>0) then begin
writeln('Ingrese numero de viaje: ');
readln(v.num);
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
while (v.codigo<>0) do begin
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
writeln ('Los dos codigos de autos que mas km recorrieron son: ', cod1, ' y ', cod2);
end;

Procedure imprimirlista (p:lista);
begin
while (p<> nil) do begin
writeln ('Numero de viaje: ', p^.dato.num);
writeln ('Codigo de auto: ', p^.dato.codigo);
writeln ('Direccion origen: ', p^.dato.origen);
writeln ('Direccion Destino: ', p^.dato.destino);
writeln ('KM recorridos: ', p^.dato.km);

p:=p^.sig;
end;
end;

var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
maskm (l);
imprimirlista(l);
end.
