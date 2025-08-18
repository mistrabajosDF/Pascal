Program mau;

type

camion=record
patente:string;
aniofabr, capacidad:integer;
end;

viaje=record
codv:integer;
codc:integer;
km:integer;
destino:string;
anio:integer;
dni:longint;
end;

vcamion=array [1..3] of camion;//deberian ser 100

lista = ^nodo;

nodo=record
dato:viaje;
sig:lista;
end;

procedure NodoOrd(var l, ult : lista; v:viaje);
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

Procedure leerviaje (var v:viaje);
begin
writeln('Ingrese codigo de viaje: ');
readln(v.codv);
if (v.codv<>-1) then begin
writeln('Ingrese codigo de camion: ');
readln(v.codc);
writeln('Ingrese distancia en km: ');
readln(v.km);
writeln('Ingrese ciudad de destino: ');
readln(v.destino);
writeln('Ingrese a?o: ');
readln(v.anio);
writeln('Ingrese DNI del chofer: ');
readln(v.dni);
end;
end;

Procedure cargarlista (var l, ult:lista);
var
v: viaje;
begin
leerviaje (v);
while (v.codv<>-1) do begin
NodoOrd (l, ult, v);
leerviaje (v);
end;
end;


var
l, ult:lista;
begin
l:= nil;
cargarlista (l, ult);
end.
